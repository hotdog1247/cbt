package com.yi.domain;

public class MemberVO {
	private int mNo;
	private String mId;
	private String mPassword;
	private String mName;
	private String mEmail;

	public MemberVO() {
	}

	public MemberVO(int mNo) {
		this.mNo = mNo;
	}

	public MemberVO(int mNo, String mId, String mPassword, String mName, String mEmail) {
		this.mNo = mNo;
		this.mId = mId;
		this.mPassword = mPassword;
		this.mName = mName;
		this.mEmail = mEmail;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", mId=" + mId + ", mPassword=" + mPassword + ", mName=" + mName + ", mEmail="
				+ mEmail + "]";
	}

}
