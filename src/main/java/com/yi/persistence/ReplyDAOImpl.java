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
import com.yi.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	private static final String namespace = "mappers.ReplyMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public BoardVO readByNo(int rNo, BoardVO bNo, MemberVO mId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNo", rNo);
		map.put("bNo", bNo);
		map.put("mId", mId);
		return sqlSession.selectOne(namespace + "readByNo", map);
	}

	@Override
	public List<ReplyVO> list() throws Exception {
		return sqlSession.selectList(namespace + "list");
	}

	@Override
	public void insert(ReplyVO vo) throws Exception {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public void update(int rNo, BoardVO bNo, MemberVO mId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNo", rNo);
		map.put("bNo", bNo);
		map.put("mId", mId);
		sqlSession.update(namespace + "update", map);
	}

	@Override
	public void delete(int rNo, BoardVO bNo, MemberVO mId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNo", rNo);
		map.put("bNo", bNo);
		map.put("mId", mId);
		sqlSession.delete(namespace + "delete", map);
	}

	@Override
	public List<ReplyVO> listBybNo(BoardVO bNo) throws Exception {
		return sqlSession.selectList(namespace+"list", bNo);
	}

	@Override
	public int totalCount(int bNo) throws Exception {
		return sqlSession.selectOne(namespace+"totalCount", bNo);
	}

	@Override
	public List<ReplyVO> listPage(int bNo, Criteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
		map.put("cri", cri);
		return sqlSession.selectList(namespace+"listPage", map);
	}

}
