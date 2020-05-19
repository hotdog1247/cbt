package com.yi.domain;

public class IncorrectVO {
	private int iNo;
	private TestResultVO rNo;
	private int eNo;
	private int eIncorrect;
	private String eSolving;

	public IncorrectVO() {
	}

	public IncorrectVO(int iNo) {
		this.iNo = iNo;
	}

	public IncorrectVO(int iNo, TestResultVO rNo, int eNo, int eIncorrect, String eSolving) {
		this.iNo = iNo;
		this.rNo = rNo;
		this.eNo = eNo;
		this.eIncorrect = eIncorrect;
		this.eSolving = eSolving;
	}

	public int getiNo() {
		return iNo;
	}

	public void setiNo(int iNo) {
		this.iNo = iNo;
	}

	public TestResultVO getrNo() {
		return rNo;
	}

	public void setrNo(TestResultVO rNo) {
		this.rNo = rNo;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public int geteIncorrect() {
		return eIncorrect;
	}

	public void seteIncorrect(int eIncorrect) {
		this.eIncorrect = eIncorrect;
	}

	public String geteSolving() {
		return eSolving;
	}

	public void seteSolving(String eSolving) {
		this.eSolving = eSolving;
	}

	@Override
	public String toString() {
		return "IncorrectVO [iNo=" + iNo + ", rNo=" + rNo + ", eNo=" + eNo + ", eIncorrect=" + eIncorrect
				+ ", eSolving=" + eSolving + "]";
	}

}
