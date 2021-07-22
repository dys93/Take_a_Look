package com.fin.app.admin.petsitManagement;

import java.sql.Date;

public class PetsitManagement {
	private long mNum;
	private int mType;//회원구분(회원/비회원)
	
	private String mId;
	private String mPwd;
	private String mNick;
	private int mRole;//회원권한(운영자0,일반1,펫시터2)
	
	private Date petStart; // 근무시작일
	private int petOnoff; // 활동여부
	private String petAct; // 급여계좌
	
	private int mon; // 근무 스케쥴
	private int tue;
	private int wed;
	private int thu;
	private int fri;
	private int sat;
	private int sun;
	
	private Date petCertif;
	private int petYN;
	private int petYard;
	private int petLarge;
	private int petWalk;
	private int petFamily;
	private int petLiving;
	private int petChild;
	

	public int getPetOnoff() {
		return petOnoff;
	}

	public void setPetOnoff(int petOnoff) {
		this.petOnoff = petOnoff;
	}

	public String getPetAct() {
		return petAct;
	}

	public void setPetAct(String petAct) {
		this.petAct = petAct;
	}

	public int getMon() {
		return mon;
	}

	public void setMon(int mon) {
		this.mon = mon;
	}

	public int getTue() {
		return tue;
	}

	public void setTue(int tue) {
		this.tue = tue;
	}

	public int getWed() {
		return wed;
	}

	public void setWed(int wed) {
		this.wed = wed;
	}

	public int getThu() {
		return thu;
	}

	public void setThu(int thu) {
		this.thu = thu;
	}

	public int getFri() {
		return fri;
	}

	public void setFri(int fri) {
		this.fri = fri;
	}

	public int getSat() {
		return sat;
	}

	public void setSat(int sat) {
		this.sat = sat;
	}

	public int getSun() {
		return sun;
	}

	public void setSun(int sun) {
		this.sun = sun;
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

	public Date getPetStart() {
		return petStart;
	}

	public void setPetStart(Date petStart) {
		this.petStart = petStart;
	}

	public Date getPetCertif() {
		return petCertif;
	}

	public void setPetCertif(Date petCertif) {
		this.petCertif = petCertif;
	}

	public int getPetYN() {
		return petYN;
	}

	public void setPetYN(int petYN) {
		this.petYN = petYN;
	}

	public int getPetYard() {
		return petYard;
	}

	public void setPetYard(int petYard) {
		this.petYard = petYard;
	}

	public int getPetLarge() {
		return petLarge;
	}

	public void setPetLarge(int petLarge) {
		this.petLarge = petLarge;
	}

	public int getPetWalk() {
		return petWalk;
	}

	public void setPetWalk(int petWalk) {
		this.petWalk = petWalk;
	}

	public int getPetFamily() {
		return petFamily;
	}

	public void setPetFamily(int petFamily) {
		this.petFamily = petFamily;
	}

	public int getPetLiving() {
		return petLiving;
	}

	public void setPetLiving(int petLiving) {
		this.petLiving = petLiving;
	}

	public int getPetChild() {
		return petChild;
	}

	public void setPetChild(int petChild) {
		this.petChild = petChild;
	}
	
	
}
