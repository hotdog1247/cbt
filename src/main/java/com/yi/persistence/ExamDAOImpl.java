package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.ExamVO;
import com.yi.domain.SearchCriteria;
import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;

@Repository
public class ExamDAOImpl implements ExamDAO {
	private static final String namespace = "mappers.ExamMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ExamVO vo) throws Exception {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public ExamVO readByNo(TestVO tNo, SubjectVO sNo, int eNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		map.put("sNo", sNo);
		map.put("eNo", eNo);
		return sqlSession.selectOne(namespace + "readByNo", map);
	}

	@Override
	public List<ExamVO> list() throws Exception {
		return sqlSession.selectList(namespace + "list");
	}

	@Override
	public void update(ExamVO vo) throws Exception {
		sqlSession.update(namespace + "update", vo);
	}

	@Override
	public void delete(ExamVO vo) throws Exception {
		sqlSession.delete(namespace + "delete", vo);
	}

	@Override
	public List<ExamVO> selectList(TestVO tNo,SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		map.put("cri", cri);
		return sqlSession.selectList(namespace + "selectList", map);
	}

	@Override
	public List<ExamVO> list2(TestVO tNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		return sqlSession.selectList(namespace+"list2", map);
	}

	@Override
	public int totalSearchCount(int tNo) {
		return sqlSession.selectOne(namespace + "totalSearchCount", tNo);
	}

	@Override
	public List<ExamVO> subjectExam(TestVO tNo, SubjectVO sNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		map.put("sNo", sNo);
		return sqlSession.selectList(namespace+"subjectExam", map);
	}

	@Override
	public void eAnswerRateUpdate(ExamVO e) throws Exception {
		sqlSession.update(namespace+"eAnswerRateUpdate", e);
	}
}
