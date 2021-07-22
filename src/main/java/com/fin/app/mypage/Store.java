package com.fin.app.mypage;

public class Store {
	private int orderNum;
	private String sDate;
	private int sdetailqty;
	private int sdetailprice;
	private String pname;
	private String pimgname;
	private String storesuboptname;
	private String storemainoptname;
	
	private int finalPrice;
	private int orderState;
	private int deliveryState;
	private int reviewOk; // 리뷰 작성 여부 - service 단에서 생성
	private int storeDetailOptNum;
	
	
	
	public int getDeliveryState() {
		return deliveryState;
	}
	public void setDeliveryState(int deliveryState) {
		this.deliveryState = deliveryState;
	}
	public int getReviewOk() {
		return reviewOk;
	}
	public void setReviewOk(int reviewOk) {
		this.reviewOk = reviewOk;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getSdetailqty() {
		return sdetailqty;
	}
	public void setSdetailqty(int sdetailqty) {
		this.sdetailqty = sdetailqty;
	}
	public int getSdetailprice() {
		return sdetailprice;
	}
	public void setSdetailprice(int sdetailprice) {
		this.sdetailprice = sdetailprice;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimgname() {
		return pimgname;
	}
	public void setPimgname(String pimgname) {
		this.pimgname = pimgname;
	}
	public String getStoresuboptname() {
		return storesuboptname;
	}
	public void setStoresuboptname(String storesuboptname) {
		this.storesuboptname = storesuboptname;
	}
	public String getStoremainoptname() {
		return storemainoptname;
	}
	public void setStoremainoptname(String storemainoptname) {
		this.storemainoptname = storemainoptname;
	}
	public int getStoreDetailOptNum() {
		return storeDetailOptNum;
	}
	public void setStoreDetailOptNum(int storeDetailOptNum) {
		this.storeDetailOptNum = storeDetailOptNum;
	}
	
}
