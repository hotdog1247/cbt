package com.yi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yi.domain.BoardVO;
import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.PageMaker;
import com.yi.domain.ReplyVO;
import com.yi.service.BoardService;
import com.yi.service.MemberService;
import com.yi.service.ReplyService;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody ReplyVO vo) {
//		System.out.println("board : "+vo.getbNo());
//		System.out.println("member : "+mId);
//		System.out.println("rContent : "+rContent);
		System.out.println("vo : "+vo.toString());
		ResponseEntity<String> entity = null;
		try {
			BoardVO bNo2 = boardService.readByNo(vo.getbNo().getbNo());
			MemberVO mId2 = memberService.readByNo(vo.getmId().getmId());
			
			ReplyVO vo2 = new ReplyVO(0, bNo2, mId2, vo.getrContent(), new Date());
			System.out.println("vo2 : "+vo2.toString());
			replyService.insert(vo2);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ex) replies/all/4090
	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") int bno) {// 주소줄에 있는 bno를 매개변수로 받겠다
		System.out.println("댓글 달러옴");
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			BoardVO bNo = boardService.readByNo(bno);
			List<ReplyVO> list = replyService.listBybNo(bNo);
			entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//
//	@RequestMapping(value = "/{rno}", method = RequestMethod.PUT)
//	public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
//		ResponseEntity<String> entity = null;
//		System.out.println("vo 수정전 : " + vo);
//		System.out.println("rno : " + rno);
//		try {
//			vo.setRno(rno);
//			replyService.update(vo);
//			System.out.println("vo 수정후 : " + vo);
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//
//	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
//	public ResponseEntity<String> delete(@PathVariable("rno") int rno) {
//		// put은 post랑 전송방식이 같고 delete는 get이랑 전송방식이 같다
//		ResponseEntity<String> entity = null;
//		try {
//			ReplyVO vo = new ReplyVO();
//			vo.setRno(rno);
//			replyService.delete(vo);
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//
	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") int bno, @PathVariable int page) {// 주소줄에 있는 bno와 page를 매개변수로 받는다.
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(replyService.totalCount(bno));
			BoardVO boardVO = boardService.readByNo(bno);
			List<ReplyVO> list = replyService.listPage(bno, cri);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			map.put("board", boardVO);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
