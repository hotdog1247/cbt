package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.TestVO;
import com.yi.persistence.TestDAO;

@Service
public class TestService {
	@Autowired
	private TestDAO dao;

	public TestVO readByNo(int tNo) throws Exception {
		return dao.readByNo(tNo);
	};

	public List<TestVO> list() throws Exception {
		return dao.list();
	};

	public void insert(TestVO vo) throws Exception {
		dao.insert(vo);
	};

	public void delete(TestVO vo) throws Exception {
		dao.delete(vo);
	};

	public void update(TestVO vo) throws Exception {
		dao.update(vo);
	};

}
