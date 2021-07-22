package com.fin.app.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int listNum, nNum;
	private String mId;
	private String nTitle;
	private String nContent;
	private String nCreated;
	private String nCateName;
	private String nImg;
	private int nHit;
	private int notice;
	private int nCateNum;

	private int nFileNum;
	private String nOriginalFile;
	private String nSaveFile;
	private long nFileSize;
	private int fileCount;
	
	// 스프링에서 파일 받기
	private List<MultipartFile> upload; // <input type="file" name="upload"

	private long gap;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getnNum() {
		return nNum;
	}

	public void setnNum(int nNum) {
		this.nNum = nNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnCreated() {
		return nCreated;
	}

	public void setnCreated(String nCreated) {
		this.nCreated = nCreated;
	}

	public String getnCateName() {
		return nCateName;
	}

	public void setnCateName(String nCateName) {
		this.nCateName = nCateName;
	}

	public String getnImg() {
		return nImg;
	}

	public void setnImg(String nImg) {
		this.nImg = nImg;
	}

	public int getnHit() {
		return nHit;
	}

	public void setnHit(int nHit) {
		this.nHit = nHit;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	public int getnCateNum() {
		return nCateNum;
	}

	public void setnCateNum(int nCateNum) {
		this.nCateNum = nCateNum;
	}

	public int getnFileNum() {
		return nFileNum;
	}

	public void setnFileNum(int nFileNum) {
		this.nFileNum = nFileNum;
	}

	public String getnOriginalFile() {
		return nOriginalFile;
	}

	public void setnOriginalFile(String nOriginalFile) {
		this.nOriginalFile = nOriginalFile;
	}

	public String getnSaveFile() {
		return nSaveFile;
	}

	public void setnSaveFile(String nSaveFile) {
		this.nSaveFile = nSaveFile;
	}

	public long getnFileSize() {
		return nFileSize;
	}

	public void setnFileSize(long nFileSize) {
		this.nFileSize = nFileSize;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}


}
