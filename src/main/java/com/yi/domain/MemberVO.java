package com.yi.domain;

public class MemberVO {
	private String mId;
	private String mPassword;
	private String mName;
	private String mEmail;

	public MemberVO() {
	}

	public MemberVO(String mId) {
		this.mId = mId;
	}

	public MemberVO(String mId, String mPassword, String mName, String mEmail) {
		this.mId = mId;
		this.mPassword = mPassword;
		this.mName = mName;
		this.mEmail = mEmail;
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
		return "MemberVO [mId=" + mId + ", mPassword=" + mPassword + ", mName=" + mName + ", mEmail=" + mEmail + "]";
	}

}
