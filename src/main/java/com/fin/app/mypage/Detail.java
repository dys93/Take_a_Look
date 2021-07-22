package com.fin.app.mypage;

public class Detail {
	// 주문
	private int mNum;
	private int orderState;
	private String orderName;
	private String orderTel;
	private String orderEmail;
	
	private int finalPrice; // p테이블과 s 테이블의 컬럼명이 같아 따로 분류
	private int orderNum;
	
	// 펫시터
	private String rDate;
	private String checkIn;
	private String checkOut;
	private int gap;
	private int petNum;
	
	private String petTitle;
	private int small;
	private int medium;
	private int large;
	
	private String petImg;
	
	// 스토어
	private String sDate;
	private int sTotPrice;
	private int sDelivCharge;
	private String sDelivDate;
	private String sZip;
	private String sAddr1;
	private String sAddr2;
	private int aMilePrice;
	private int uMilePrice;
	
	private String pName; // 제품명
	private int delivType;
	private String storeMainOptName; // 상위옵션명
	private String storeSubOptName;	// 하위옵션명
	private int sDetailQty;	// 주문수량
	private int sDetailPrice; // 주문단가 (1개당 가격)
	private int deliveryState;
	private String pImgName;
	
	private int totSale;
	
	

	
	
	
	
	
	public int getGap() {
		return gap;
	}
	public void setGap(int gap) {
		this.gap = gap;
	}
	public int getSmall() {
		return small;
	}
	public void setSmall(int small) {
		this.small = small;
	}
	public int getMedium() {
		return medium;
	}
	public void setMedium(int medium) {
		this.medium = medium;
	}
	public int getLarge() {
		return large;
	}
	public void setLarge(int large) {
		this.large = large;
	}
	public int getDeliveryState() {
		return deliveryState;
	}
	public void setDeliveryState(int deliveryState) {
		this.deliveryState = deliveryState;
	}
	public int getTotSale() {
		return totSale;
	}
	public void setTotSale(int totSale) {
		this.totSale = totSale;
	}
	public int getDelivType() {
		return delivType;
	}
	public void setDelivType(int delivType) {
		this.delivType = delivType;
	}
	public int getuMilePrice() {
		return uMilePrice;
	}
	public void setuMilePrice(int uMilePrice) {
		this.uMilePrice = uMilePrice;
	}
	public int getaMilePrice() {
		return aMilePrice;
	}
	public void setaMilePrice(int aMilePrice) {
		this.aMilePrice = aMilePrice;
	}
	public String getPetImg() {
		return petImg;
	}
	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}
	public String getpImgName() {
		return pImgName;
	}
	public void setpImgName(String pImgName) {
		this.pImgName = pImgName;
	}
	public String getStoreMainOptName() {
		return storeMainOptName;
	}
	public void setStoreMainOptName(String storeMainOptName) {
		this.storeMainOptName = storeMainOptName;
	}
	public String getStoreSubOptName() {
		return storeSubOptName;
	}
	public void setStoreSubOptName(String storeSubOptName) {
		this.storeSubOptName = storeSubOptName;
	}
	public int getsDetailQty() {
		return sDetailQty;
	}
	public void setsDetailQty(int sDetailQty) {
		this.sDetailQty = sDetailQty;
	}
	public int getsDetailPrice() {
		return sDetailPrice;
	}
	public void setsDetailPrice(int sDetailPrice) {
		this.sDetailPrice = sDetailPrice;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getsTotPrice() {
		return sTotPrice;
	}
	public void setsTotPrice(int sTotPrice) {
		this.sTotPrice = sTotPrice;
	}
	public int getsDelivCharge() {
		return sDelivCharge;
	}
	public void setsDelivCharge(int sDelivCharge) {
		this.sDelivCharge = sDelivCharge;
	}
	public String getsDelivDate() {
		return sDelivDate;
	}
	public void setsDelivDate(String sDelivDate) {
		this.sDelivDate = sDelivDate;
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
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getPetTitle() {
		return petTitle;
	}
	public void setPetTitle(String petTitle) {
		this.petTitle = petTitle;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
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
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getPetNum() {
		return petNum;
	}
	public void setPetNum(int petNum) {
		this.petNum = petNum;
	}
	
	
	
	
}
