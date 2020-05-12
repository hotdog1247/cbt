package com.yi.domain;

public class IncorrectVO {
	private TestResultVO rNo;
	private int eIncorrect;
	private String eSolving;

	public IncorrectVO() {
	}

	public IncorrectVO(TestResultVO rNo, int eIncorrect) {
		this.rNo = rNo;
		this.eIncorrect = eIncorrect;
	}

	public IncorrectVO(TestResultVO rNo, int eIncorrect, String eSolving) {
		this.rNo = rNo;
		this.eIncorrect = eIncorrect;
		this.eSolving = eSolving;
	}

	public TestResultVO getrNo() {
		return rNo;
	}

	public void setrNo(TestResultVO rNo) {
		this.rNo = rNo;
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
		return "IncorrectVO [rNo=" + rNo + ", eIncorrect=" + eIncorrect + ", eSolving=" + eSolving + "]";
	}
}
