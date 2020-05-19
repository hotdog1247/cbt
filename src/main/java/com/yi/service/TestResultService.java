package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.MemberVO;
import com.yi.domain.TestResultVO;
import com.yi.persistence.TestResultDAO;

@Service
public class TestResultService {
	@Autowired
	private TestResultDAO dao;

	public void insert(TestResultVO vo) throws Exception {
		dao.insert(vo);
	};

	public TestResultVO readByNo(int rNo) throws Exception {
		return dao.readByNo(rNo);
	};

	public List<TestResultVO> list() throws Exception {
		return dao.list();
	};

	public void delete(int rNo) throws Exception {
		dao.delete(rNo);
	};

	public List<TestResultVO> readBymId(MemberVO mId) throws Exception {
		return dao.readBymId(mId);
	};

	public int lastRNo() throws Exception {
		return dao.lastRNo();
	};

	public int lastRNo2() throws Exception {
		return dao.lastRNo2();
	};
}
