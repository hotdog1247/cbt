package com.yi.persistence;

import java.util.List;

import com.yi.domain.ExamVO;
import com.yi.domain.SearchCriteria;
import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;

public interface ExamDAO {
	public void insert(ExamVO vo) throws Exception;

	public ExamVO readByNo(TestVO tNo, SubjectVO sNo, int eNo) throws Exception;

	public List<ExamVO> list() throws Exception;

	public void update(ExamVO vo) throws Exception;

	public void delete(ExamVO vo) throws Exception;

	public List<ExamVO> selectList(TestVO tNo, SearchCriteria cri) throws Exception;

	public List<ExamVO> list2(TestVO tNo) throws Exception;

	public int totalSearchCount(int tNo);
	
	public List<ExamVO> subjectExam(TestVO tNo, SubjectVO sNo) throws Exception;
	
	public void eAnswerRateUpdate(ExamVO e) throws Exception;
}
