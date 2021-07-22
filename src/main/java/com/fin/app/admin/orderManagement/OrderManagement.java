package com.fin.app.admin.orderManagement;

public class OrderManagement {
	private long orderNum;
	private long mNum;
	private int mType;
	private int orderState;
	private int deliveryState;
	private int finalPrice;
	private String orderName;
	
	private String orderTel;
	private String orderEmail;
	
	private String sDate;
	private int sDelivCharge;
	private String sZip;
	private String sAddr1;
	private String sAddr2;
	
	private int aMilePrice;
	
	
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
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
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public int getDeliveryState() {
		return deliveryState;
	}
	public void setDeliveryState(int deliveryState) {
		this.deliveryState = deliveryState;
	}
	public String getOrderTel() {
		return orderTel;
	}
	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getsDelivCharge() {
		return sDelivCharge;
	}
	public void setsDelivCharge(int sDelivCharge) {
		this.sDelivCharge = sDelivCharge;
	}
	public String getsZip() {
		return sZip;
	}
	public void setsZip(String sZip) {
		this.sZip = sZip;
	}
	public String getsAddr1() {
		return sAddr1;
	}
	public void setsAddr1(String sAddr1) {
		this.sAddr1 = sAddr1;
	}
	public String getsAddr2() {
		return sAddr2;
	}
	public void setsAddr2(String sAddr2) {
		this.sAddr2 = sAddr2;
	}
	public int getaMilePrice() {
		return aMilePrice;
	}
	public void setaMilePrice(int aMilePrice) {
		this.aMilePrice = aMilePrice;
	}

	
	
	
	
}
