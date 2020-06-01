package com.yi.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import com.yi.domain.SubjectVO;
import com.yi.domain.TestResultVO;
import com.yi.domain.TestVO;
import com.yi.service.SubjectService;
import com.yi.service.TestService;

@Controller
public class TestController {
	@Autowired
	private TestService testService;
	@Autowired
	private SubjectService subjectService;

	@RequestMapping(value = "/test/list", method = RequestMethod.GET)
	public String testNameGet(Model model) throws Exception {
		List<TestVO> list = testService.list();
		List<String> modelList = new ArrayList<>();
		for (TestVO t : list) {
			if (!modelList.contains(t.gettName())) {
				modelList.add(t.gettName());
			}
		}
		model.addAttribute("list", modelList);
		return "test/testList";
	}

	@ResponseBody
	@RequestMapping(value = "/test/listtName", method = RequestMethod.GET)
	public ResponseEntity<List<Integer>> testYearGet(String tName) throws Exception {
		ResponseEntity<List<Integer>> entity = null;
		try {
			List<TestVO> list = testService.listBytName(tName);
			List<Integer> yearList = new ArrayList<>();
			for (TestVO t : list) {
				if (!yearList.contains(t.gettYear())) {
					yearList.add(t.gettYear());
				}
			}
			entity = new ResponseEntity<List<Integer>>(yearList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Integer>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/test/listtYear", method = RequestMethod.GET)
	public ResponseEntity<List<Integer>> testOrderGet(String tName, String tYear) throws Exception {
		int tYear2 = Integer.parseInt(tYear);
		ResponseEntity<List<Integer>> entity = null;
		try {
			List<TestVO> list = testService.listBytYearAndtName(tName, tYear2);
			List<Integer> orderList = new ArrayList<Integer>();
			for (TestVO t : list) {
				if (!orderList.contains(t.gettOrder())) {
					orderList.add(t.gettOrder());
				} else {
				}
			}
			entity = new ResponseEntity<List<Integer>>(orderList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Integer>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/test/newAdd", method = RequestMethod.GET)
	public String testNewAdd(Model model) throws Exception {
		return "test/testAdd";
	}
	
	@RequestMapping(value = "/test/add", method = RequestMethod.GET)
	public String makingExam(Model model) throws Exception {
		List<TestVO> list = testService.list();
		List<String> modelList = new ArrayList<>();
		for (TestVO t : list) {
			if (!modelList.contains(t.gettName())) {
				modelList.add(t.gettName());
			}
		}
		model.addAttribute("list", modelList);
		return "test/testAdd";
	}
	
	@ResponseBody
	@RequestMapping(value = "/test/testAdd", method = RequestMethod.GET)
	public ResponseEntity<List<String>> testRegister(TestVO vo) throws Exception {
		ResponseEntity<List<String>> entity = null;
		try {
			vo.settNo(testService.list().size()+1);
			System.out.println("vo : "+vo.toString());
			testService.insert(vo);
			List<TestVO> list = testService.list();
			List<String> modelList = new ArrayList<>();
			for (TestVO t : list) {
				if (!modelList.contains(t.gettName())) {
					modelList.add(t.gettName());
				}
			}
			entity = new ResponseEntity<List<String>>(modelList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/test/subAdd", method = RequestMethod.GET)
	public ResponseEntity<List<String>> subRegister(TestVO test, SubjectVO subject) throws Exception {
		ResponseEntity<List<String>> entity = null;
		try {
			System.out.println("test : " + test.toString());
			TestVO testVo = testService.readBytYearAndtNameAndtOrder(test.gettName(), test.gettYear(), test.gettOrder());
			System.out.println("test : " + testVo.toString());
			int subCnt = subjectService.list2(testVo).size()+1;
			subject.setsNo(subCnt);
			subject.settNo(testVo);
			System.out.println("subject : "+subject.toString());
			subjectService.insert(subject);
			entity = new ResponseEntity<List<String>>( HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/exam/listPage", method = RequestMethod.POST)
	public String testAddPost(@RequestParam(required = false, defaultValue = "0") Map<String, Object> map, Model model, HttpSession session) throws Exception {
		String tName = (String) map.get("tName");
		String tYear2 = (String) map.get("tYear");
		String tOrder2 = (String) map.get("tOrder");
		int tYear = Integer.parseInt(tYear2);
		int tOrder = Integer.parseInt(tOrder2);
		String sName = (String) map.get("sName");
		List<Object> eNo = new ArrayList<Object>();
		List<Object> sNo = new ArrayList<Object>();
		TestVO tNo = testService.readBytYearAndtNameAndtOrder(tName, tYear, tOrder);
//		SubjectVO sNo = subjectService.readByNo(tNo, sNo)
		// 주석친 부분부터 해야됨
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
}
