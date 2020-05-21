package com.yi.persistence;

import java.util.List;

import com.yi.domain.BoardVO;
import com.yi.domain.MemberVO;
import com.yi.domain.ReplyVO;

public interface ReplyDAO {
	public BoardVO readByNo(int rNo, BoardVO bNo, MemberVO mId) throws Exception;

	public List<ReplyVO> list() throws Exception;

	public void insert(ReplyVO vo) throws Exception;

	public void update(int rNo, BoardVO bNo, MemberVO mId) throws Exception;

	public void delete(int rNo, BoardVO bNo, MemberVO mId) throws Exception;
}
