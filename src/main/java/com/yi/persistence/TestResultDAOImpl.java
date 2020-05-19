package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.MemberVO;
import com.yi.domain.TestResultVO;

@Repository
public class TestResultDAOImpl implements TestResultDAO {
	private static final String namespace = "mappers.TestResultMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(TestResultVO tr) throws Exception {
		sqlSession.insert(namespace + "insert", tr);
	}

	@Override
	public TestResultVO readByNo(int rNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNo", rNo);
		return sqlSession.selectOne(namespace + "readByNo", map);
	}

	@Override
	public List<TestResultVO> list() throws Exception {
		return sqlSession.selectList(namespace + "list");
	}

	@Override
	public void delete(int rNo) throws Exception {
		sqlSession.delete(namespace + "update", rNo);
	}

	@Override
	public List<TestResultVO> readBymId(MemberVO mId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		return sqlSession.selectList(namespace + "readBymId", map);
	}

	@Override
	public int lastRNo() throws Exception {
		return sqlSession.selectOne(namespace + "lastRNo");
	}

	@Override
	public int lastRNo2() throws Exception {
		return sqlSession.selectOne(namespace + "lastRNo2");
	}

}
