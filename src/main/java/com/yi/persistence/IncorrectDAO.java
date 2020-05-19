package com.yi.persistence;

import java.util.List;

import com.yi.domain.IncorrectVO;
import com.yi.domain.TestResultVO;

public interface IncorrectDAO {
	
	public List<IncorrectVO> readByrNo(TestResultVO rNo) throws Exception;

	public List<IncorrectVO> list(TestResultVO rNo) throws Exception;

	public void insert(IncorrectVO incorrectVO) throws Exception;

	public void delete(IncorrectVO incorrectVO) throws Exception;

	public void update(IncorrectVO incorrectVO) throws Exception;
}
