package com.yi.persistence;

import java.util.List;

import com.yi.domain.MemberVO;
import com.yi.domain.TestResultVO;

public interface TestResultDAO {

	public void insert(TestResultVO tr) throws Exception;

	public TestResultVO readByNo(int rNo) throws Exception;

	public List<TestResultVO> list() throws Exception;

	public void delete(int rNo) throws Exception;

	public List<TestResultVO> readBymId(MemberVO mId) throws Exception;

	public int lastRNo() throws Exception;

	public int lastRNo2() throws Exception;
}
