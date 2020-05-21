package com.yi.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.BoardVO;
import com.yi.domain.MemberVO;
import com.yi.domain.PageMaker;
import com.yi.domain.SearchCriteria;
import com.yi.service.BoardService;
import com.yi.service.MemberService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Resource(name = "uploadPath")
	private String uploadPath;
	private boolean flag = false;
	
	@RequestMapping(value = "board/list", method = RequestMethod.GET)
	public String boardGet(Model model, SearchCriteria cri) throws Exception {
		List<BoardVO> list = boardService.listSearchCriteria(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.totalSearchCount(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "/board/list";
	}
	
	@RequestMapping(value = "board/register", method = RequestMethod.GET)
	public String boardAddGet() {
		return "/board/register";
	}
	
	@RequestMapping(value = "board/register", method = RequestMethod.POST)
	public String boardAddPost(String bTitle, String bContent, String mId) throws Exception {
		MemberVO m = memberService.readByNo(mId);
		BoardVO vo2 = new BoardVO(m, bTitle, bContent, new Date(), 0, 0);
		boardService.insert(vo2);
		return "redirect:/board/list";
	}
	@RequestMapping(value = "board/read", method = RequestMethod.GET)
	public String readPage(int bNo, SearchCriteria cri, Model model,HttpSession session) throws Exception {
		BoardVO vo = boardService.readByNo(bNo);
		if (!flag) {
			MemberVO m = memberService.readByNo((String)session.getAttribute("Auth"));
			boardService.increaseCnt(vo, m);
			flag = false;
		}
		System.out.println("readPage안이다!!!");
		model.addAttribute("cri", cri);
		model.addAttribute("board", vo);
		return "/board/readPage";
	}
}

	
	
	
	