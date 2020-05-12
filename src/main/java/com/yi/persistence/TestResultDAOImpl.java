package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.yi.domain.MemberVO;
import com.yi.domain.TestResultVO;
import com.yi.domain.TestVO;

public class TestResultDAOImpl implements TestResultDAO {
	private static final String namespace = "mappers.TestResultMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(TestResultVO tr) throws Exception {
		sqlSession.insert(namespace+"insert", tr);
	}

	@Override
	public TestResultVO readByNo(int rNo, MemberVO mNo, TestVO tNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNo", rNo);
		map.put("mNo", mNo);
		map.put("tNo", tNo);
		return sqlSession.selectOne(namespace+"readByNo", map);
	}

	@Override
	public List<TestResultVO> list() throws Exception {
		return sqlSession.selectList(namespace+"list");
	}

	@Override
	public void update(int rNo) throws Exception {
		sqlSession.update(namespace+"update", rNo);
	}

	@Override
	public void delete(int rNo) throws Exception {
		sqlSession.delete(namespace+"update", rNo);
	}

}
