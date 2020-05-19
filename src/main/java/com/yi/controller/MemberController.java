package com.yi.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.ExamVO;
import com.yi.domain.MemberVO;
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
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private TestService testService;
	@Autowired
	private ExamService examService;
	@Autowired
	private TestResultService testResultService;
	@Autowired
	private IncorrectService incorrectService;
	@Autowired
	private SubjectService subjectService;
	
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
		session.setAttribute("Auth", vo.getmId());
		return "redirect:/";
	}

	@RequestMapping(value = "member/insert", method = RequestMethod.GET)
	public String memberGet() throws Exception {
		return "member/memberInsert";
	}

	@RequestMapping(value = "member/insert", method = RequestMethod.POST)
	public String memberPost(MemberVO member) throws Exception {
		memberService.insert(member);
		return "redirect:/login";
	}

	@RequestMapping(value = "member/testResult", method = RequestMethod.GET)
	public String testResultGet(Model model, HttpSession session) throws Exception {
		String m = (String) session.getAttribute("Auth");
//		System.out.println("Id of member : "+ m);
		MemberVO mId = memberService.readByNo(m);
//		System.out.println("member : "+ mId);
		List<TestResultVO> list = testResultService.readBymId(mId);
//		System.out.println("list : "+ list.toString());
//		for(TestResultVO tr : list) {
//			System.out.println("tr : "+tr.toString());
//		}
//		incorrectService.readByNo(rNo);
		model.addAttribute("list", list);
//		incorrectService.readByNo(mId);
		return "/member/testResult";
	}
	
	@ResponseBody
	@RequestMapping(value = "member/subject", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> subjectGet(Model model, HttpSession session, TestVO test) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			TestVO tNo = testService.readByNo(test.gettNo());
			List<SubjectVO> subList = subjectService.list2(tNo);
			for(SubjectVO s : subList) {
				List<ExamVO> exList = examService.subjectExam(tNo, s);
				for(ExamVO e : exList) {
					e.geteAnswer();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
