package com.yi.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.ExamVO;
import com.yi.domain.IncorrectVO;
import com.yi.domain.MemberVO;
import com.yi.domain.PageMaker;
import com.yi.domain.SearchCriteria;
import com.yi.domain.SubjectVO;
import com.yi.domain.TestResultVO;
import com.yi.domain.TestVO;
import com.yi.service.ExamService;
import com.yi.service.IncorrectService;
import com.yi.service.MemberService;
import com.yi.service.SubjectService;
import com.yi.service.TestResultService;
import com.yi.service.TestService;

@Controller
public class ExamController {
	@Autowired
	private TestService testService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private ExamService examService;
	@Autowired
	private TestResultService testResultService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private IncorrectService incorrectService;
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/exam/list", method = RequestMethod.GET)
	public String examGet(Model model, TestVO vo) throws Exception {
		PageMaker pageMaker = new PageMaker();
		SearchCriteria cri = new SearchCriteria();
		pageMaker.setCri(cri);
		TestVO tNo = testService.readBytYearAndtNameAndtOrder(vo.gettName(), vo.gettYear(), vo.gettOrder());
		System.out.println("testvo : " + tNo.toString());
		pageMaker.setTotalCount(examService.totalSearchCount(tNo.gettNo()));
		List<ExamVO> selectList = examService.selectList(tNo, cri);
		List<ExamVO> list = examService.list2(tNo);
		model.addAttribute("selectList", selectList);
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("tNo", tNo);
		return "exam/examList";
	}

	@ResponseBody
	@RequestMapping(value = "/exam/listPage", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> examPageGet(TestVO test, int page) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			SearchCriteria cri = new SearchCriteria();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(examService.totalSearchCount(test.gettNo()));
			List<ExamVO> selectList = examService.selectList(test, cri);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("selectList", selectList);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/exam/listPage", method = RequestMethod.POST)
	public String examPagePost(@RequestParam(required = false, defaultValue = "0") Map<String, Object> map, Model model, HttpSession session) throws Exception {
		String tNo3 = (String) map.get("tNo");
		int rTime = Integer.parseInt((String)map.get("rTime"));
		int tNo2 = Integer.parseInt(tNo3);
		List<Object> eNo = new ArrayList<Object>();
		List<Object> sNo = new ArrayList<Object>();
		TestVO tNo = testService.readByNo(tNo2);
		List<SubjectVO> subject = subjectService.list2(tNo);
		int rExCnt = 0;
		int nonIncorrect = 0;
		boolean rPass = true;
		for (SubjectVO s : subject) {
			List<ExamVO> subjectvo = examService.subjectExam(tNo, s);
			int answerCnt = 0;
			int examCnt = 0;
			for (ExamVO e : subjectvo) {
				List<Object> exam = new ArrayList<Object>();
				exam.add(e);
				if (map.get("eNo" + e.geteNo() + "") == null) {
					int checkingval = 0;
					exam.add(checkingval);
				} else {
					int checkingval = Integer.parseInt((String) map.get("eNo" + e.geteNo() + ""));
					exam.add(checkingval);
					if (checkingval == e.geteAnswer()) {
						answerCnt++;
					}
				}
				examCnt++;
				eNo.add(exam);
			}
			List<Object> sub = new ArrayList<Object>();
			sub.add(s);
			sub.add(answerCnt);
			sub.add(examCnt);
			double rPass2 = (((double)answerCnt/examCnt)*100);
			if(rPass2 <40) {
				rPass = false;
			}
			rExCnt = rExCnt+ examCnt;
			nonIncorrect = nonIncorrect+answerCnt;
			sNo.add(sub);
		}
		String mId = (String) session.getAttribute("Auth");
		MemberVO mem = memberService.readByNo(mId);
		double rScore2 = (((double)nonIncorrect/rExCnt)*100);
		int rScore = (int)rScore2;
		testResultService.insert(new TestResultVO(0, mem, tNo, new Date(), rPass, rScore, rExCnt, rTime));
		int rCnt = testResultService.lastRNo2();
		TestResultVO tr = testResultService.readByNo(rCnt);
		for (SubjectVO s : subject) {
			for (ExamVO e : examService.subjectExam(tNo, s)) {
				int rIncorrect = 0;
				if (map.get("eNo" + e.geteNo() + "") == null) {
					int checkingval = 0;
					rIncorrect = checkingval;
				} else {
					int checkingval = Integer.parseInt((String) map.get("eNo" + e.geteNo() + ""));
					rIncorrect = checkingval;
				}
				if(e.geteAnswer() != rIncorrect) {
					incorrectService.insert(new IncorrectVO(0, tr, e.geteNo(), rIncorrect, e.geteSolving()));
					examService.viewExamUpdate(e, 0);
				}
				else {
					examService.viewExamUpdate(e, 1);
				}
				System.out.println("exam : "+e.toString());
			}
		}
		model.addAttribute("exam", eNo);
		model.addAttribute("subject", sNo);
		return "exam/examResult";
	}

	@ResponseBody
	@RequestMapping(value = "displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) {
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		try {
			in = new FileInputStream(uploadPath + "/" + fileName);
			String format = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = null;
			if (format.equalsIgnoreCase("png")) {
				mType = MediaType.IMAGE_PNG;
			} else if (format.equalsIgnoreCase("jpg") || format.equalsIgnoreCase("jpeg")) {
				mType = MediaType.IMAGE_JPEG;
			} else if (format.equalsIgnoreCase("gif")) {
				mType = MediaType.IMAGE_GIF;
			}
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/subject/listSubject", method = RequestMethod.GET)
	public ResponseEntity<List<ExamVO>> testOrderGet(TestVO test) throws Exception {
		ResponseEntity<List<ExamVO>> entity = null;
		try {
			System.out.println("test : "+test.toString());
			TestVO tNo = testService.readBytYearAndtNameAndtOrder(test.gettName(), test.gettYear(), test.gettOrder());
			List<ExamVO> list = examService.list2(tNo);
			for(ExamVO e: list) {
				System.out.println("e : "+e.toString());
			}
			entity = new ResponseEntity<List<ExamVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ExamVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	@RequestMapping(value = "/exam/mod", method = RequestMethod.GET)
//	public String examModPost(@PathVariable TestVO test, SubjectVO subject, ExamVO exam, Model model) throws Exception {
	public String examModPost(int eNo,int sNo, String tName, int tYear, int tOrder, Model model) throws Exception {
//		public String examModPost(@PathVariable String eNo, @PathVariable String sNo, @PathVariable String tName,@PathVariable String tYear,@PathVariable String tOrder, Model model) throws Exception {
//		TestVO tNo = testService.readByNo(test.gettNo());
//		SubjectVO sNo = subjectService.readByNo(tNo, subject);
//		ExamVO ex = examService.readByNo(tNo, sNo, exam.geteNo());
//		model.addAttribute("exam",ex);
//		exam.settNo(test);
//		exam.setsNo(subject);
//		examService.update(exam);
		TestVO tNo = testService.readBytYearAndtNameAndtOrder(tName, tYear, tOrder);
		SubjectVO s = new SubjectVO(sNo);
		SubjectVO sub = subjectService.readByNo(tNo, s);
		ExamVO exam = examService.readByNo(tNo, sub, eNo);
		model.addAttribute("exam", exam);
		return "exam/modExam";
	}
	@RequestMapping(value = "/exam/mod", method = RequestMethod.POST)
	public String examModGet(TestVO test, SubjectVO subject, ExamVO exam, Model model) throws Exception {
		System.out.println("exam/mod 안인가?");
		TestVO tNo = testService.readByNo(test.gettNo());
		SubjectVO sNo = subjectService.readByNo(tNo, subject);
		ExamVO ex = examService.readByNo(tNo, sNo, exam.geteNo());
		model.addAttribute("exam",ex);
		return "exam/mod";
	}
	
	@ResponseBody
	@RequestMapping(value = "/exam/listsName", method = RequestMethod.GET)
	public ResponseEntity<List<SubjectVO>> addExSubGet(TestVO test) throws Exception {
		ResponseEntity<List<SubjectVO>> entity = null;
		try {
			TestVO tNo = testService.readBytYearAndtNameAndtOrder(test.gettName(), test.gettYear(), test.gettOrder());
			List<SubjectVO> list = subjectService.list2(tNo);
			entity = new ResponseEntity<List<SubjectVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<SubjectVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/exam/exAdd", method = RequestMethod.GET)
//	public ResponseEntity<ExamVO> addExGet(TestVO test, SubjectVO subject, ExamVO exam) throws Exception {
//	public ResponseEntity<ExamVO> addExGet(ExamVO exam) throws Exception {
	public ResponseEntity<ExamVO> addExGet(String tName, String tYear, String tOrder, String sNo, String eNo, String eName, String eAnswer, String eContent, String eContent2, String eContent3, String eContent4) throws Exception {
		System.out.println("fffffffffffff");
		ResponseEntity<ExamVO> entity = null;
		try {
			TestVO tNo = testService.readBytYearAndtNameAndtOrder(tName, Integer.parseInt(tYear), Integer.parseInt(tOrder));
			SubjectVO s = new SubjectVO(Integer.parseInt(sNo)); 
			SubjectVO sub = subjectService.readByNo(tNo, s);
			ExamVO exam = new ExamVO(tNo, sub, Integer.parseInt(eNo), eName, 0, eContent, eContent2, eContent3, eContent4, Integer.parseInt(eAnswer), "", 0, 0); 
			
			System.out.println("exam : " + exam.toString());
			examService.insert(exam);
			ExamVO exam2 = examService.readByNo(tNo, sub, exam.geteNo());
			entity = new ResponseEntity<ExamVO>(exam2, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ExamVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
