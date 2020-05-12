package com.yi.domain;

import java.util.Date;

public class TestResultVO {
	private int rNo;
	private MemberVO mId;
	private TestVO tNo;
	private Date rDate;
	private boolean rPass;
	private int rScore;
	private int rExCnt;

	public TestResultVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TestResultVO(int rNo) {
		super();
		this.rNo = rNo;
	}

	public TestResultVO(int rNo, MemberVO mId, TestVO tNo) {
		super();
		this.rNo = rNo;
		this.mId = mId;
		this.tNo = tNo;
	}

	public TestResultVO(int rNo, MemberVO mId, TestVO tNo, Date rDate, boolean rPass, int rScore, int rExCnt) {
		super();
		this.rNo = rNo;
		this.mId = mId;
		this.tNo = tNo;
		this.rDate = rDate;
		this.rPass = rPass;
		this.rScore = rScore;
		this.rExCnt = rExCnt;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public MemberVO getmId() {
		return mId;
	}

	public void setmId(MemberVO mId) {
		this.mId = mId;
	}

	public TestVO gettNo() {
		return tNo;
	}

	public void settNo(TestVO tNo) {
		this.tNo = tNo;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public boolean isrPass() {
		return rPass;
	}

	public void setrPass(boolean rPass) {
		this.rPass = rPass;
	}

	public int getrScore() {
		return rScore;
	}

	public void setrScore(int rScore) {
		this.rScore = rScore;
	}

	public int getrExCnt() {
		return rExCnt;
	}

	public void setrExCnt(int rExCnt) {
		this.rExCnt = rExCnt;
	}

	@Override
	public String toString() {
		return "TestResultVO [rNo=" + rNo + ", mId=" + mId + ", tNo=" + tNo + ", rDate=" + rDate + ", rPass=" + rPass
				+ ", rScore=" + rScore + ", rExCnt=" + rExCnt + "]";
	}

}
