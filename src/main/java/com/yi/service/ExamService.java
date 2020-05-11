package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.ExamVO;
import com.yi.domain.SearchCriteria;
import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;
import com.yi.persistence.ExamDAO;

@Service
public class ExamService {
	@Autowired
	private ExamDAO dao;

	public void insert(ExamVO vo) throws Exception {
		dao.insert(vo);
	};

	public ExamVO readByNo(TestVO tNo, SubjectVO sNo, int eNo) throws Exception {
		return dao.readByNo(tNo, sNo, eNo);
	};

	public List<ExamVO> list() throws Exception {
		return dao.list();
	};

	public void update(ExamVO vo) throws Exception {
		dao.update(vo);
	};

	public void delete(ExamVO vo) throws Exception {
		dao.delete(vo);
	};
	public List<ExamVO> selectList(TestVO tNo, SearchCriteria cri) throws Exception{
		return dao.selectList(tNo, cri);
	};
	public List<ExamVO> list2(TestVO tNo) throws Exception{
		return dao.list2(tNo);
	}

	public int totalSearchCount(int tNo) {
		return dao.totalSearchCount(tNo);
	};
	public List<ExamVO> subjectExam(TestVO tNo, SubjectVO sNo) throws Exception{
		return dao.subjectExam(tNo, sNo);
	};
}
