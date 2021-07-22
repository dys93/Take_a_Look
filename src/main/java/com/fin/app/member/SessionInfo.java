package com.fin.app.member;

public class SessionInfo {
	private long mNum;//고객번호
	private String mId;//회원아이디
	private int mRole; //회원권한(운영자0,일반1,펫시터2)
	private String mNick;//닉네임
	
	public long getmNum() {
		return mNum;
	}
	public void setmNum(long mNum) {
		this.mNum = mNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getmRole() {
		return mRole;
	}
	public void setmRole(int mRole) {
		this.mRole = mRole;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	
	
}
