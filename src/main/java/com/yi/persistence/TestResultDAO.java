package com.yi.persistence;

import java.util.List;

import com.yi.domain.MemberVO;
import com.yi.domain.TestResultVO;
import com.yi.domain.TestVO;

public interface TestResultDAO {
	
	public void insert(TestResultVO tr) throws Exception;

	public TestResultVO readByNo(int rNo, MemberVO mNo, TestVO tNo) throws Exception;

	public List<TestResultVO> list() throws Exception;

	public void update(int rNo) throws Exception;

	public void delete(int rNo) throws Exception;

}
