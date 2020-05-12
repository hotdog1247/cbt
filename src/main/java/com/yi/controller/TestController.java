package com.yi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.TestVO;
import com.yi.service.TestService;

@Controller
public class TestController {
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "/test/list", method = RequestMethod.GET)
	public String testGet(Model model) throws Exception{
		List<TestVO> list = testService.list();
		model.addAttribute("list", list);
		return "test/testList";
	}
}
