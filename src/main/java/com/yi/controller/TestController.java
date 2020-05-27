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

import com.yi.domain.TestVO;
import com.yi.service.TestService;

@Controller
public class TestController {
	@Autowired
	private TestService testService;

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
}
