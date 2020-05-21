package com.yi.domain;

import java.util.Date;

public class ReplyVO {
	private int rNo;
	private BoardVO bNo;
	private MemberVO mId;
	private String rContent;
	private Date rDate;

	public ReplyVO() {

	}

	public ReplyVO(int rNo, BoardVO bNo, MemberVO mId, String rContent, Date rDate) {
		super();
		this.rNo = rNo;
		this.bNo = bNo;
		this.mId = mId;
		this.rContent = rContent;
		this.rDate = rDate;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public BoardVO getbNo() {
		return bNo;
	}

	public void setbNo(BoardVO bNo) {
		this.bNo = bNo;
	}

	public MemberVO getmId() {
		return mId;
	}

	public void setmId(MemberVO mId) {
		this.mId = mId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [rNo=" + rNo + ", bNo=" + bNo + ", mId=" + mId + ", rContent=" + rContent + ", rDate=" + rDate
				+ "]";
	}

}
