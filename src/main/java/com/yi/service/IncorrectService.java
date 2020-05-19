package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.IncorrectVO;
import com.yi.domain.TestResultVO;
import com.yi.persistence.IncorrectDAO;

@Service
public class IncorrectService {
	@Autowired
	private IncorrectDAO dao;
	
	public List<IncorrectVO> readByNo(TestResultVO rNo) throws Exception{
		return dao.readByrNo(rNo);
	};

	public List<IncorrectVO> list(TestResultVO rNo) throws Exception{
		return dao.list(rNo);
	};

	public void insert(IncorrectVO incorrectVO) throws Exception{
		dao.insert(incorrectVO);
	};

	public void delete(IncorrectVO incorrectVO) throws Exception{
		dao.delete(incorrectVO);
	};

	public void update(IncorrectVO incorrectVO) throws Exception{
		dao.update(incorrectVO);
	};
}
