package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.MemberVO;
import com.yi.persistence.MemberDAO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;

	public MemberVO readByNo(String mId) throws Exception {
		return dao.readByNo(mId);
	};

	public List<MemberVO> list() throws Exception {
		return dao.list();
	};

	public void insert(MemberVO member) throws Exception {
		dao.insert(member);
	};

	public void delete(String mId) throws Exception {
		dao.delete(mId);
	};

	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	};

	public MemberVO findId(String mName, String mEmail) throws Exception {
		return dao.findId(mName, mEmail);
	};

	public MemberVO findPw(String mId, String mEmail) throws Exception {
		return dao.findPw(mId, mEmail);
	};
	
	public MemberVO overlapMember(MemberVO vo) throws Exception{
		return dao.overlapMember(vo);
	};
}
