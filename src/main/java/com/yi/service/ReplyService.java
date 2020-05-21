package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.BoardVO;
import com.yi.domain.MemberVO;
import com.yi.domain.ReplyVO;
import com.yi.persistence.ReplyDAO;

@Service
public class ReplyService {
	@Autowired
	private ReplyDAO dao;

	public BoardVO readByNo(int rNo, BoardVO bNo, MemberVO mId) throws Exception {
		return dao.readByNo(rNo, bNo, mId);
	};

	public List<ReplyVO> list() throws Exception {
		return dao.list();
	};

	public void insert(ReplyVO vo) throws Exception {
		dao.insert(vo);
	};

	public void update(int rNo, BoardVO bNo, MemberVO mId) throws Exception {
		dao.update(rNo, bNo, mId);
	};

	public void delete(int rNo, BoardVO bNo, MemberVO mId) throws Exception {
		dao.delete(rNo, bNo, mId);
	};
}
