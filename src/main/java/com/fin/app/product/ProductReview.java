package com.fin.app.product;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductReview {
	private int rNum; //리뷰번호
	private String rTitle; //리뷰제목
	private int rGrade; //평점
	private String rCreated; //작성날짜
	private String mId; //작성자 아이디
	private String orderNum; //주문 코드
	private int rImgNum;//이미지파일번호
	private String imagefilename; //이미지파일이름
	private List<MultipartFile> uploads; //다중파일
	private String rContent;
	private String mProfileImg;
	private String mNick;
	
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public int getrGrade() {
		return rGrade;
	}
	public void setrGrade(int rGrade) {
		this.rGrade = rGrade;
	}
	public String getrCreated() {
		return rCreated;
	}
	public void setrCreated(String rCreated) {
		this.rCreated = rCreated;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getrImgNum() {
		return rImgNum;
	}
	public void setrImgNum(int rImgNum) {
		this.rImgNum = rImgNum;
	}
	public String getImagefilename() {
		return imagefilename;
	}
	public void setImagefilename(String imagefilename) {
		this.imagefilename = imagefilename;
	}
	public List<MultipartFile> getUploads() {
		return uploads;
	}
	public void setUploads(List<MultipartFile> uploads) {
		this.uploads = uploads;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getmProfileImg() {
		return mProfileImg;
	}
	public void setmProfileImg(String mProfileImg) {
		this.mProfileImg = mProfileImg;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	
	
}
