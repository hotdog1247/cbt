package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.IncorrectVO;
import com.yi.domain.TestResultVO;

@Repository
public class IncorrectDAOImpl implements IncorrectDAO {
	private static final String namespace = "mappers.IncorrectMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public IncorrectVO readByNo(TestResultVO rNo) throws Exception {
		return sqlSession.selectOne(namespace + "readByNo", rNo);
	}

	@Override
	public List<IncorrectVO> list(TestResultVO rNo) throws Exception {
		return sqlSession.selectList(namespace + "list", rNo);
	}

	@Override
	public void insert(IncorrectVO incorrectVO) throws Exception {
		sqlSession.insert(namespace + "insert", incorrectVO);
	}

	@Override
	public void delete(IncorrectVO incorrectVO) throws Exception {
		sqlSession.delete(namespace + "delete", incorrectVO);
	}

	@Override
	public void update(IncorrectVO incorrectVO) throws Exception {
		sqlSession.update(namespace + "update", incorrectVO);
	}

}
