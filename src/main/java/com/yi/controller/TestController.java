package com.yi.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.SubjectVO;
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
			subjectService.insert(testVo, subject);
			entity = new ResponseEntity<List<String>>( HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
