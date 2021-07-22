package com.fin.app.admin.memberManagement;

public class MemberManagement {
	private String mId;
	private String mNick;
	private String mName;
	private int mRole; // 회원권한(일반회원1, 펫시터2)
	private long mNum;
	private String mBirth;
	
	private int mState; // 회원상태(활동0, 잠금1)
	private String createdDate;
	private String lastLogin;
	
	private String mEmail;
	private String mTel;
	private String mZip;
	private String mAddr1;
	private String mAddr2;
	
	private long msNum;
	private int msCode;
	private String memo;
	private String registerId;
	private String registration_date;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getmRole() {
		return mRole;
	}
	public void setmRole(int mRole) {
		this.mRole = mRole;
	}
	public long getmNum() {
		return mNum;
	}
	public void setmNum(long mNum) {
		this.mNum = mNum;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public int getmState() {
		return mState;
	}
	public void setmState(int mState) {
		this.mState = mState;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
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
	public long getMsNum() {
		return msNum;
	}
	public void setMsNum(long msNum) {
		this.msNum = msNum;
	}
	public int getMsCode() {
		return msCode;
	}
	public void setMsCode(int msCode) {
		this.msCode = msCode;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	
	
	
}
