package com.fin.app.member;

public class Member {
	private long mNum;
	private int mType;//회원구분(회원/비회원)
	//member
	private String mId;
	private String mPwd;
	private String mNick;
	private int mRole;//회원권한(운영자0,일반1,펫시터2)
	
	private String mName;
	private String mTel, mTel1, mTel2, mTel3;
	private String mZip;
	private String mAddr1, mAddr2;	
	private String mEmail, mEmail1,mEmail2;
	private String mBirth;
	

	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public long getmNum() {
		return mNum;
	}
	public void setmNum(long mNum) {
		this.mNum = mNum;
	}
	public int getmType() {
		return mType;
	}
	public void setmType(int mType) {
		this.mType = mType;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	public int getmRole() {
		return mRole;
	}
	public void setmRole(int mRole) {
		this.mRole = mRole;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String getmTel1() {
		return mTel1;
	}
	public void setmTel1(String mTel1) {
		this.mTel1 = mTel1;
	}
	public String getmTel2() {
		return mTel2;
	}
	public void setmTel2(String mTel2) {
		this.mTel2 = mTel2;
	}
	public String getmTel3() {
		return mTel3;
	}
	public void setmTel3(String mTel3) {
		this.mTel3 = mTel3;
	}
	public String getmZip() {
		return mZip;
	}
	public void setmZip(String mZip) {
		this.mZip = mZip;
	}
	public String getmAddr1() {
		return mAddr1;
	}
	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}
	public String getmAddr2() {
		return mAddr2;
	}
	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmEmail1() {
		return mEmail1;
	}
	public void setmEmail1(String mEmail1) {
		this.mEmail1 = mEmail1;
	}
	public String getmEmail2() {
		return mEmail2;
	}
	public void setmEmail2(String mEmail2) {
		this.mEmail2 = mEmail2;
	}
	@Override
	public String toString() {
		return "Member [mNum=" + mNum + ", mType=" + mType + ", mId=" + mId + ", mPwd=" + mPwd + ", mNick=" + mNick
				+ ", mRole=" + mRole + ", mName=" + mName + ", mTel=" + mTel + ", mTel1=" + mTel1 + ", mTel2=" + mTel2
				+ ", mTel3=" + mTel3 + ", mZip=" + mZip + ", mAddr1=" + mAddr1 + ", mAddr2=" + mAddr2 + ", mEmail="
				+ mEmail + ", mEmail1=" + mEmail1 + ", mEmail2=" + mEmail2 + ", mBirth=" + mBirth + "]";
	}

}
