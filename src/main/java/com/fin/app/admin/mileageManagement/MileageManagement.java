package com.fin.app.admin.mileageManagement;

import java.sql.Date;

public class MileageManagement {
	private long mileNum;
	private String mId;
	private int mileType;
	private int milePrice;
	private Date mileDate;
	
	public long getMileNum() {
		return mileNum;
	}
	public void setMileNum(long mileNum) {
		this.mileNum = mileNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getMileType() {
		return mileType;
	}
	public void setMileType(int mileType) {
		this.mileType = mileType;
	}
	public int getMilePrice() {
		return milePrice;
	}
	public void setMilePrice(int milePrice) {
		this.milePrice = milePrice;
	}
	public Date getMileDate() {
		return mileDate;
	}
	public void setMileDate(Date mileDate) {
		this.mileDate = mileDate;
	}
	
	
}
