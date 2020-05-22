package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.BoardVO;
import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final String namespace = "mappers.BoardMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public BoardVO readByNo(int bNo) throws Exception {
		return sqlSession.selectOne(namespace + "readByNo", bNo);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		return sqlSession.selectList(namespace + "list");
	}

	@Override
	public void insert(BoardVO vo) throws Exception {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update(namespace + "update", vo);
	}

	@Override
	public void delete(int bNo) throws Exception {
		sqlSession.delete(namespace + "delete", bNo);
	}

	@Override
	public List<BoardVO> listSearchCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + "listSearchCriteria", cri);
	}

	@Override
	public int totalSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + "totalSearchCount", cri);
	}

	@Override
	public void increaseCnt(BoardVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		sqlSession.update(namespace + "increaseCnt", map);
	}

}
