package com.fin.app.admin.donationManagement;

import java.sql.Date;

public class DonationManagement {
	private long donaNum;
	private String mId;
	private String donaPrice;
	private Date donaStart;
	private Date donaEnd;
	
	private int orderNum;
	private String mName;
	private int finalPrice;
	private String sDate;
	
	private int totalDonation;
	
	public long getDonaNum() {
		return donaNum;
	}
	public void setDonaNum(long donaNum) {
		this.donaNum = donaNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getDonaPrice() {
		return donaPrice;
	}
	public void setDonaPrice(String donaPrice) {
		this.donaPrice = donaPrice;
	}
	public Date getDonaStart() {
		return donaStart;
	}
	public void setDonaStart(Date donaStart) {
		this.donaStart = donaStart;
	}
	public Date getDonaEnd() {
		return donaEnd;
	}
	public void setDonaEnd(Date donaEnd) {
		this.donaEnd = donaEnd;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getTotalDonation() {
		return totalDonation;
	}
	public void setTotalDonation(int totalDonation) {
		this.totalDonation = totalDonation;
	}
	
	
}
