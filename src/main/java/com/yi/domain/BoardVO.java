package com.yi.domain;

import java.util.Date;

public class BoardVO {
	private int bNo;
	private MemberVO mId;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int viewCnt;
	private int replyCnt;

	public BoardVO() {
	}

	public BoardVO(int bNo) {
		this.bNo = bNo;
	}

	public BoardVO(MemberVO mId, String bTitle, String bContent, Date bDate, int viewCnt, int replyCnt) {
		this.mId = mId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.viewCnt = viewCnt;
		this.replyCnt = replyCnt;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public MemberVO getmId() {
		return mId;
	}

	public void setmId(MemberVO mId) {
		this.mId = mId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bNo=" + bNo + ", mId=" + mId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bDate="
				+ bDate + ", viewCnt=" + viewCnt + ", replyCnt=" + replyCnt + "]";
	}

}
