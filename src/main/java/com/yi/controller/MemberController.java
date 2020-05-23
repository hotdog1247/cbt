package com.yi.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.yi.domain.IncorrectVO;
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
		MemberVO mId = memberService.readByNo(m);
		List<TestResultVO> list = testResultService.readBymId(mId);
		List<List<IncorrectVO>> incorrectList = new ArrayList<List<IncorrectVO>>();
		for(TestResultVO tr : list) {
			System.out.println("tr : "+tr.toString());
			List<IncorrectVO> incorrect =  incorrectService.readByNo(tr);
			incorrectList.add(incorrect);
		}		
		model.addAttribute("incorrectList", incorrectList);
		model.addAttribute("list", list);
		return "/member/testResult";
	}
	
	@ResponseBody
	@RequestMapping(value = "member/incorrect", method = RequestMethod.GET)
	public ResponseEntity<List<Object>> incorrectGet(Model model, HttpSession session, TestVO test, int rNo) throws Exception {
		ResponseEntity<List<Object>> entity = null;
		try {
			TestResultVO tr =  testResultService.readByNo(rNo);
			List<Object> list = new ArrayList<Object>();
			List<IncorrectVO> incorrect =  incorrectService.readByNo(tr);
			TestVO tNo = testService.readByNo(test.gettNo());
			List<ExamVO> e = examService.list2(tNo);
			list.add(incorrect);
			list.add(e);
			entity = new ResponseEntity<List<Object>>(list ,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "member/subject", method = RequestMethod.GET)
	public ResponseEntity<List<Object>> subjectGet(Model model, HttpSession session, TestVO test, int rNo) throws Exception {
		ResponseEntity<List<Object>> entity = null;
		try {
			TestResultVO tr =  testResultService.readByNo(rNo);
			List<Object> list = new ArrayList<Object>();
			List<IncorrectVO> incorrect =  incorrectService.readByNo(tr);
			TestVO tNo = testService.readByNo(test.gettNo());
			List<ExamVO> e = examService.list2(tNo);
			List<SubjectVO> s = subjectService.list2(tNo);
			list.add(incorrect);
			list.add(e);
			list.add(s);
			System.out.println("들어왔나");
			entity = new ResponseEntity<List<Object>>(list ,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//	@RequestMapping(value = "member/incorrectEx", method = RequestMethod.GET)
//	public String incorrectExGet(Model model, HttpSession session) throws Exception {
//		MemberVO mId = memberService.readByNo((String)session.getAttribute("Auth"));
//		
//		return null;
//	}
	@ResponseBody
	@RequestMapping(value = "member/find", method = RequestMethod.GET)
	public ResponseEntity<MemberVO> find(MemberVO vo) throws Exception {
		System.out.println("find에 들어왔냐");
		System.out.println("vo : "+vo.toString());
		ResponseEntity<MemberVO> entity = null;
		if(vo.getmName() != null) {
			System.out.println("아이디 찾기냐");
			MemberVO m = findId(vo);
			if(m == null) {
				entity = new ResponseEntity<MemberVO>(HttpStatus.NOT_FOUND);
			}
			entity = new ResponseEntity<MemberVO>(m,HttpStatus.OK);
		}
		else if(vo.getmId() != null) {
			System.out.println("비밀번호 찾기냐");
			MemberVO m = findPw(vo);
			if(m == null) {
				entity = new ResponseEntity<MemberVO>(HttpStatus.NOT_FOUND);
			}
			entity = new ResponseEntity<MemberVO>(m,HttpStatus.OK);
		}
		else {
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("다 되었냐");
		return entity;
	}
	
	private MemberVO findId(MemberVO vo) throws Exception {
		MemberVO vo2 = memberService.findId(vo.getmName(), vo.getmEmail());
		if(vo2 == null) {
			return null;
		}
		System.out.println("id : "+vo2.toString());
		return vo2;
	}
	private MemberVO findPw(MemberVO vo) throws Exception {
		MemberVO vo2 = memberService.findPw(vo.getmId(), vo.getmEmail());
		if(vo2 == null) {
			return null;
		}
		else {
			
		}
		System.out.println("pw : "+vo2.toString());
		return vo2;
	}
}
