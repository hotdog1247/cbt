package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.BoardVO;
import com.yi.domain.SearchCriteria;
import com.yi.persistence.BoardDAO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO dao;

	public BoardVO readByNo(int bNo) throws Exception {
		return dao.readByNo(bNo);
	};

	public List<BoardVO> list() throws Exception {
		return dao.list();
	};

	public void insert(BoardVO vo) throws Exception {
		dao.insert(vo);
	};

	public void delete(int bNo) throws Exception {
		dao.delete(bNo);
	};

	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteria(cri);
	}

	public int totalSearchCount(SearchCriteria cri) throws Exception {
		return dao.totalSearchCount(cri);
	}

	public void increaseCnt(BoardVO vo) throws Exception {
		dao.increaseCnt(vo);
	};

}
