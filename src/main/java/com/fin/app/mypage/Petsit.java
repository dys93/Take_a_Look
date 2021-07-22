package com.fin.app.mypage;

public class Petsit {
	private int orderNum; //예약번호
	private String checkIn;
	private String checkOut;
	private String rDate; // 예약일
	private int mNum; // 고객번호
	private int petNum; // 펫시터예약신청글 번호
	private int finalPrice;
	
	private String petTitle; // 글 제목
	private String petImg; // 리스트에 사용할 대표사진
	private String orderState; 
	
	private int reviewOk; // 리뷰 작성 여부 - service 단에서 생성
	
	
	
	
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getPetImg() {
		return petImg;
	}
	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}
	public int getReviewOk() {
		return reviewOk;
	}
	public void setReviewOk(int reviewOk) {
		this.reviewOk = reviewOk;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
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
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public int getPetNum() {
		return petNum;
	}
	public void setPetNum(int petNum) {
		this.petNum = petNum;
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
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String sDate) {
		this.rDate = sDate;
	} 
	
	
}
