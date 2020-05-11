package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TestVO;

@Repository
public class TestDAOImpl implements TestDAO {
	private static final String namespace = "mappers.TestMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public TestVO readByNo(int tNo) throws Exception {
		return sqlSession.selectOne(namespace + "readByNo", tNo);
	}

	@Override
	public List<TestVO> list() throws Exception {
		return sqlSession.selectList(namespace + "list");
	}

	@Override
	public void insert(TestVO vo) throws Exception {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public void delete(TestVO vo) throws Exception {
		sqlSession.delete(namespace + "insert", vo);
	}

	@Override
	public void update(TestVO vo) throws Exception {
		sqlSession.update(namespace + "insert", vo);
	}

}
