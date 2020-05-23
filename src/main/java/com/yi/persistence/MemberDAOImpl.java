package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	private static final String namespace = "mappers.MemberMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO readByNo(String mId) throws Exception {
		return sqlSession.selectOne(namespace + "readByNo", mId);
	}

	@Override
	public List<MemberVO> list() throws Exception {
		return sqlSession.selectList(namespace + "list");
	}

	@Override
	public void insert(MemberVO member) throws Exception {
		sqlSession.insert(namespace + "insert", member);
	}

	@Override
	public void delete(String mId) throws Exception {
		sqlSession.delete(namespace + "delete", mId);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mId", vo.getmId());
		map.put("mPassword", vo.getmPassword());
		map.put("mName", vo.getmName());
		sqlSession.update(namespace + "update", map);
	}

	@Override
	public MemberVO findId(String mName, String mEmail) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mName", mName);
		map.put("mEmail", mEmail);
		return sqlSession.selectOne(namespace+"findId", map);
	}

	@Override
	public MemberVO findPw(String mId, String mEmail) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mId", mId);
		map.put("mEmail", mEmail);
		return sqlSession.selectOne(namespace+"findPw", map);
	}

}
