package com.yi.persistence;

import java.util.List;

import com.yi.domain.BoardVO;
import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.SearchCriteria;

public interface BoardDAO {
	public BoardVO readByNo(int bNo) throws Exception;

	public List<BoardVO> list() throws Exception;

	public void insert(BoardVO vo) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(int bNo) throws Exception;

	public List<BoardVO> listSearchCriteria(Criteria cri) throws Exception;

	public int totalSearchCount(SearchCriteria cri) throws Exception;

	public void increaseCnt(BoardVO vo) throws Exception;
}
