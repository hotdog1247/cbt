package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;
import com.yi.persistence.SubjectDAO;

@Service
public class SubjectService {
	@Autowired
	private SubjectDAO dao;

	public SubjectVO readByNo(TestVO tNo, SubjectVO sNo) throws Exception {
		return dao.readByNo(tNo, sNo);
	};

	public List<SubjectVO> list() throws Exception {
		return dao.list();
	};

	public void insert(SubjectVO sNo) throws Exception {
		dao.insert(sNo);
	};

	public void delete(TestVO tNo, SubjectVO sNo) throws Exception {
		dao.delete(tNo, sNo);
	};

	public void update(TestVO tNo, SubjectVO sNo) throws Exception {
		dao.update(tNo, sNo);
	};

	public List<SubjectVO> list2(TestVO tNo) throws Exception {
		return dao.list2(tNo);
	};

	public int newSubjectCnt(TestVO tNo) throws Exception {
		return dao.newSubjectCnt(tNo);
	};

	public List<SubjectVO> readByTest(TestVO tNo) throws Exception {
		return dao.readByTest(tNo);
	};
}
