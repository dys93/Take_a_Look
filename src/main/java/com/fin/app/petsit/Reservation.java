package com.fin.app.petsit;

public class Reservation {
	
	private String mId; //아이디
	private String orderName;
	private String orderTel;
	private String orderEmail;
	//private String mName;
	private String mNick;
	private String petImg;//사진
	
	
	//펫시터 예약
	private int orderNum;//주문코드 
	private String checkIn;//체크인날짜
	private String checkOut;//체크아웃날짜
	private int mNum;//고객번호
	private int petNum;//글번호
	private int finalPrice;//최종금액
	private String rDate; //예약을 신청한 날짜
	
	
	
	
	//예약 취소
	private String cancelDate; //취소일자
	private String cancelContent; //취소사유 
	
	
	//옵션받기 
	private int small;
	private int medium;
	private int large;
	
	//옵션- 여기서만 쓰는 부분 
	private int tax;
	private int dayCnt;
	private int sum;
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
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
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	public String getCancelContent() {
		return cancelContent;
	}
	public void setCancelContent(String cancelContent) {
		this.cancelContent = cancelContent;
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
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public int getDayCnt() {
		return dayCnt;
	}
	public void setDayCnt(int dayCnt) {
		this.dayCnt = dayCnt;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getPetImg() {
		return petImg;
	}
	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}


	
}	