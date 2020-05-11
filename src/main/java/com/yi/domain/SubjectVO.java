package com.yi.domain;

public class SubjectVO {
	private TestVO tNo;
	private int sNo;
	private String sName;
	public SubjectVO() {
	}

	public SubjectVO(int sNo) {
		this.sNo = sNo;
	}

	public SubjectVO(TestVO tNo, int sNo) {
		this.tNo = tNo;
		this.sNo = sNo;
	}

	public SubjectVO(TestVO tNo, int sNo, String sName) {
		this.tNo = tNo;
		this.sNo = sNo;
		this.sName = sName;
	}

	public TestVO gettNo() {
		return tNo;
	}

	public void settNo(TestVO tNo) {
		this.tNo = tNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	@Override
	public String toString() {
		return "SubjectVO [tNo=" + tNo + ", sNo=" + sNo + ", sName=" + sName + "]";
	}

}
