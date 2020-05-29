package com.yi.persistence;

import java.util.List;

import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;

public interface SubjectDAO {

	public SubjectVO readByNo(TestVO tNo, SubjectVO sNo) throws Exception;

	public List<SubjectVO> list() throws Exception;

	public void insert(TestVO tNo, SubjectVO sNo) throws Exception;

	public void delete(TestVO tNo, SubjectVO sNo) throws Exception;

	public void update(TestVO tNo, SubjectVO sNo) throws Exception;

	public List<SubjectVO> list2(TestVO tNo) throws Exception;

	public int newSubjectCnt(TestVO tNo) throws Exception;
}
