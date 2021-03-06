package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;

@Repository
public class SubjectDAOImpl implements SubjectDAO {
	private static final String namespace = "mappers.SubjectMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public SubjectVO readByNo(TestVO tNo, SubjectVO sNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		map.put("sNo", sNo);
		return sqlSession.selectOne(namespace+"readByNo", map);
	}

	@Override
	public List<SubjectVO> list() throws Exception {
		return sqlSession.selectList(namespace+"list");
	}

	@Override
	public void insert(SubjectVO sNo) throws Exception {
		sqlSession.insert(namespace+"insert", sNo);
	}

	@Override
	public void delete(TestVO tNo, SubjectVO sNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		map.put("vo", sNo);
		sqlSession.delete(namespace+"delete", map);
	}

	@Override
	public void update(TestVO tNo, SubjectVO sNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		map.put("vo", sNo);
		sqlSession.update(namespace+"update", map);
	}

	@Override
	public List<SubjectVO> list2(TestVO tNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		return sqlSession.selectList(namespace+"list2", map);
	}

	@Override
	public int newSubjectCnt(TestVO tNo) throws Exception {
		return sqlSession.selectOne(namespace+"newSubjectCnt", tNo);
	}

	@Override
	public List<SubjectVO> readByTest(TestVO tNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tNo", tNo);
		return sqlSession.selectList(namespace+"readByTest", map);
	}

}
