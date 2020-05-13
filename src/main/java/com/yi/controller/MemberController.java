package com.yi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.MemberVO;
import com.yi.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginGet() {
		return "/member/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(MemberVO vo, Model model, HttpSession session) throws Exception {
		MemberVO vo2 = memberService.readByNo(vo.getmId());
		if (vo2 == null) {
			model.addAttribute("error", "아이디가 없습니다");
			return "/member/login";
		} else if (vo2.getmPassword().equals(vo.getmPassword()) == false) {
			model.addAttribute("error", "pw가 틀림");
			return "/member/login";
		}
		System.out.println("nickName : "+vo.getmNickname());
		if(vo.getmNickname() == null) {
			session.setAttribute("Auth", vo.getmId());
		}
		else {
			session.setAttribute("Auth", vo.getmNickname());
		}
		return "redirect:/";
	}

	@RequestMapping(value = "member/insert", method = RequestMethod.GET)
	public String memberGet() throws Exception {
		return "member/memberInsert";
	}

	@RequestMapping(value = "member/insert", method = RequestMethod.POST)
	public String memberPost(MemberVO member) throws Exception {
		memberService.insert(member);
		return "member/login";
	}
}
