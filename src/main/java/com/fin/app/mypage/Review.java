package com.fin.app.mypage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Review {
	private int rNum; // seq를 담을 공간.
	
	private String rTitle;
	private String rContent;
	private int rGrade;
	
	private String mId; // 작성자
	private String orderNum; // 주문코드
	
	private String imagefilename;
	private List<MultipartFile> uploads; // 다중파일
	
	
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
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getrGrade() {
		return rGrade;
	}
	public void setrGrade(int rGrade) {
		this.rGrade = rGrade;
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
	
	
}
