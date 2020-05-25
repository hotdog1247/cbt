package com.yi.domain;

public class TestVO {
	private int tNo;
	private String tName;
	private int tYear;
	private int tOrder;
	private int tTime;

	public TestVO() {
	}

	public TestVO(int tNo) {
		this.tNo = tNo;
	}

	public TestVO(int tNo, String tName, int tYear, int tOrder) {
		this.tNo = tNo;
		this.tName = tName;
		this.tYear = tYear;
		this.tOrder = tOrder;
	}

	public TestVO(int tNo, String tName, int tYear, int tOrder, int tTime) {
		this.tNo = tNo;
		this.tName = tName;
		this.tYear = tYear;
		this.tOrder = tOrder;
		this.tTime = tTime;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public int gettYear() {
		return tYear;
	}

	public void settYear(int tYear) {
		this.tYear = tYear;
	}

	public int gettOrder() {
		return tOrder;
	}

	public void settOrder(int tOrder) {
		this.tOrder = tOrder;
	}

	public int gettTime() {
		return tTime;
	}

	public void settTime(int tTime) {
		this.tTime = tTime;
	}

	@Override
	public String toString() {
		return "TestVO [tNo=" + tNo + ", tName=" + tName + ", tYear=" + tYear + ", tOrder=" + tOrder + ", tTime="
				+ tTime + "]";
	}

}
