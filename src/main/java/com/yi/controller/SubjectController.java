package com.yi.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;
import com.yi.service.SubjectService;
import com.yi.service.TestService;

@Controller
public class SubjectController {
	@Autowired
	private TestService testService;
	@Autowired
	private SubjectService subjectService;
//	
//	@ResponseBody
//	@RequestMapping(value = "/subject/listSubject", method = RequestMethod.GET)
//	public ResponseEntity<List<SubjectVO>> testOrderGet(TestVO test) throws Exception {
//		ResponseEntity<List<SubjectVO>> entity = null;
//		try {
//			List<SubjectVO> list = subjectService.readByTest(test);
//			for(SubjectVO s: list) {
//				System.out.println("s : "+s.toString());
//			}
//			entity = new ResponseEntity<List<SubjectVO>>(list, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<List<SubjectVO>>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//	@ResponseBody
//	@RequestMapping(value = "/subject/listSubject", method = RequestMethod.GET)
//	public ResponseEntity<List<SubjectVO>> testOrderGet(TestVO test) throws Exception {
//		ResponseEntity<List<SubjectVO>> entity = null;
//		try {
//			List<SubjectVO> list = subjectService.readByTest(test);
//			for(SubjectVO s: list) {
//				System.out.println("s : "+s.toString());
//			}
//			entity = new ResponseEntity<List<SubjectVO>>(list, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<List<SubjectVO>>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
}
