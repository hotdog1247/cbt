package com.yi.persistence;

import java.util.List;

import com.yi.domain.TestVO;

public interface TestDAO {

	public TestVO readByNo(int tNo) throws Exception;

	public List<TestVO> list() throws Exception;

	public void insert(TestVO vo) throws Exception;

	public void delete(TestVO vo) throws Exception;

	public void update(TestVO vo) throws Exception;

	public List<TestVO> listBytName(String tName) throws Exception;

	public List<TestVO> listBytYearAndtName(String tName, int tYear) throws Exception;

	public TestVO readBytYearAndtNameAndtOrder(String tName, int tYear, int tOrder) throws Exception;
}
