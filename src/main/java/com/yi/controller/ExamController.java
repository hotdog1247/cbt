package com.yi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.yi.domain.PageMaker;
import com.yi.domain.SearchCriteria;
import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;
import com.yi.service.ExamService;
import com.yi.service.SubjectService;
import com.yi.service.TestService;

@Controller
public class ExamController {
	@Autowired
	private TestService testService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private ExamService examService;
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/exam/list", method = RequestMethod.GET)
	public String examGet(Model model, SearchCriteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);		
		TestVO tNo = testService.readByNo(1);
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
			for(ExamVO e : selectList) {
				System.out.println("e : "+e.toString());
			}
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
	public String examPagePost(@RequestParam(required = false, defaultValue = "0") Map<String, Object> map, Model model) throws Exception {
		String tNo3 = (String) map.get("tNo");
		int tNo2 =Integer.parseInt(tNo3);
//		System.out.println("tNo : "+map.get("tNo"));
		Map<String, Object> eNo = new HashMap<String, Object>();
		Map<String, Object> sNo = new HashMap<String, Object>();
		TestVO tNo = testService.readByNo(tNo2);
		/* List<ExamVO> list = examService.list2(tNo); */
		List<SubjectVO> subject = subjectService.list2(tNo);
		/* int examLength = list.size(); */
		for(SubjectVO s : subject) {
			int i = s.getsNo();
//			System.out.println("과목 : "+s.toString());
//			System.out.println("============================================");
			List<ExamVO> subjectvo =  examService.subjectExam(tNo, s);
			int answerCnt = 0;
			int examCnt = 0;
			for(ExamVO e : subjectvo) {
				/* int j = e.geteNo(); */
				List<Object> exam = new ArrayList<Object>();
				exam.add(e);
//				System.out.println("과목번호 : "+e.getsNo().getsNo());
//				System.out.println("문제번호 : "+e.geteNo());
//				System.out.println("정답 : "+e.geteAnswer());
				System.out.println("이미지 이름 : "+e.geteDescription());
				System.out.println("이미지 이름 : "+e.toString());
				if(map.get("eNo"+e.geteNo()+"") == null) {
					System.out.println("체크값 : "+0);
					int checkingval = 0;
					exam.add(checkingval);
				}
				else {
					System.out.println("체크값 : "+map.get("eNo"+e.geteNo()+""));
					int checkingval = Integer.parseInt((String)map.get("eNo"+e.geteNo()+""));
					exam.add(checkingval);
					if(checkingval == e.geteAnswer()) {
						answerCnt++;
					}
				}
				examCnt++;
				eNo.put("eNo"+e.geteNo(), exam);
				System.out.println("============================================");
			}
			System.out.println("맞춘 갯수 : "+answerCnt);
			List<Object> sub = new ArrayList<Object>();
			sub.add(s);
			sub.add(answerCnt);
			sub.add(examCnt);
			sNo.put("subject"+i, sub);
		}
//		System.out.println("문제 갯수 :"+examLength);
//		for(ExamVO e : examService.list2(tNo)) {
//			System.out.println("정답들 : "+e.geteAnswer());
//		}
//		System.out.println("============================================");
//		for(int i = 1; i<examLength+1; i++) {
//			ExamVO e = list.get(i-1);
//			List<Object> exam = new ArrayList<Object>();
//			exam.add(e);
//			System.out.println("과목번호2 : "+e.getsNo().getsNo());
//			System.out.println("문제번호2 : "+e.geteNo());
//			System.out.println("정답2 : "+e.geteAnswer());
//			if(map.get("eNo"+i+"") == null) {
//				System.out.println("체크값 : "+0);
//				int checkingval = 0;
//				exam.add(checkingval);
//			}
//			else {
//				System.out.println("체크값 : "+map.get("eNo"+i+""));
//				int checkingval = Integer.parseInt((String)map.get("eNo"+i+""));
//				exam.add(checkingval);
//			}
//			eNo.put("eNo"+i, exam);
//			System.out.println("============================================");
//		}
//		for(int i = 0; i<eNo.size();i++) {
//			
//		}
//		System.out.println("subject of map : "+sNo.get("subject"));
//		System.out.println("cnt of map : "+sNo.get("cnt"));
		System.out.println(sNo.keySet());
		System.out.println(eNo.keySet());
		model.addAttribute("exam", eNo);
		model.addAttribute("subject", sNo);
		return "exam/examResult";
	}
	@ResponseBody
	@RequestMapping(value = "displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName){
		ResponseEntity<byte[]> entity = null;
		System.out.println("fileName : "+fileName);
		/*
		 * File file = new File(fileName); if(!file.exists()) { entity = new
		 * ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST); }
		 */
		InputStream in = null;
		try {
			in = new FileInputStream(uploadPath+"/"+fileName);
			String format = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType =null;
			if(format.equalsIgnoreCase("png")) {
				mType = MediaType.IMAGE_PNG;
			}
			else if(format.equalsIgnoreCase("jpg") || format.equalsIgnoreCase("jpeg")) {
				mType = MediaType.IMAGE_JPEG;
			}
			else if(format.equalsIgnoreCase("gif")) {
				mType = MediaType.IMAGE_GIF;
			}
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
