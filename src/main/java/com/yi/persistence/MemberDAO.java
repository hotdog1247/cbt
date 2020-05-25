package com.yi.persistence;

import java.util.List;

import com.yi.domain.MemberVO;

public interface MemberDAO {

	public MemberVO readByNo(String mId) throws Exception;

	public List<MemberVO> list() throws Exception;

	public void insert(MemberVO member) throws Exception;

	public void delete(String mId) throws Exception;

	public void update(MemberVO vo) throws Exception;

	public MemberVO findId(String mName, String mEmail) throws Exception;

	public MemberVO findPw(String mId, String mEmail) throws Exception;
	
	public MemberVO overlapMember(MemberVO vo) throws Exception;
}
