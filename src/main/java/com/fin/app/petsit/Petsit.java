package com.fin.app.petsit;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Petsit {
	
	private int petNum;//글번호 
	private int listNum;//리스트번호(여기서만)
	//펫시터 부가정보
	private String mId; //아이디
	
	private String mNick;//닉네임
	
	private int petStart; //근무시작일
	private String petAct; //급여계좌 (14자리) 
	
	//글등록정보
	private String petTitle; //글제목
	private String petContent; //소개글 
	private int petYN; //반려동물유무 (0 무 1유)
	private int petYard; //마당유무 (0무 1유)
	private int petLarge; //대형견가능유무 (0무 1유)
	private int petWalk; //산책로 (0무 1유)
	private int petFamily; //가족형태 (1:2인 이하 가구 2:3인 가구 3:4인 가구 4:5인 이상 가구)
	private int petLiving; //거주형태 (1:아파트 2:단독주택 3:빌라 4:오피스텔)
	private int petChild; //자녀 (1:없음  2:미취학 아동 3:초등생 자녀)
	private String petCertif; //교육증취득일
	private String petAddr; //근무주소
	
	//펫시터 이미지
	private int petImgNum; //파일번호
	private String petImg; //이미지 파일이름
	private List<MultipartFile> upload; //파일업로드
	
	//펫시터 스케줄 //가능1 불가0
	private int mon; 
	private int tue;
	private int wed;
	private int thu;
	private int fri;
	private int sat;
	private int sun;
	
	//펫시터 상세 주소
	private String mAddr1, mAddr2;
	
	
	//프로필
	private String mProfileImg;
	
	
	public int getPetNum() {
		return petNum;
	}
	public void setPetNum(int petNum) {
		this.petNum = petNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getPetStart() {
		return petStart;
	}
	public void setPetStart(int petStart) {
		this.petStart = petStart;
	}
	public String getPetAct() {
		return petAct;
	}
	public void setPetAct(String petAct) {
		this.petAct = petAct;
	}
	public int getPetYN() {
		return petYN;
	}
	public void setPetYN(int petYN) {
		this.petYN = petYN;
	}
	public int getPetYard() {
		return petYard;
	}
	public void setPetYard(int petYard) {
		this.petYard = petYard;
	}
	public int getPetLarge() {
		return petLarge;
	}
	public void setPetLarge(int petLarge) {
		this.petLarge = petLarge;
	}
	public String getPetTitle() {
		return petTitle;
	}
	public void setPetTitle(String petTitle) {
		this.petTitle = petTitle;
	}
	public String getPetContent() {
		return petContent;
	}
	public void setPetContent(String petContent) {
		this.petContent = petContent;
	}
	public int getPetFamily() {
		return petFamily;
	}
	public void setPetFamily(int petFamily) {
		this.petFamily = petFamily;
	}
	public int getPetWalk() {
		return petWalk;
	}
	public void setPetWalk(int petWalk) {
		this.petWalk = petWalk;
	}
	public int getPetLiving() {
		return petLiving;
	}
	public void setPetLiving(int petLiving) {
		this.petLiving = petLiving;
	}
	public int getPetChild() {
		return petChild;
	}
	public void setPetChild(int petChild) {
		this.petChild = petChild;
	}
	public String getPetCertif() {
		return petCertif;
	}
	public void setPetCertif(String petCertif) {
		this.petCertif = petCertif;
	}
	public String getPetAddr() {
		return petAddr;
	}
	public void setPetAddr(String petAddr) {
		this.petAddr = petAddr;
	}
	public int getPetImgNum() {
		return petImgNum;
	}
	public void setPetImgNum(int petImgNum) {
		this.petImgNum = petImgNum;
	}
	public String getPetImg() {
		return petImg;
	}
	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	public int getMon() {
		return mon;
	}
	public void setMon(int mon) {
		this.mon = mon;
	}
	public int getTue() {
		return tue;
	}
	public void setTue(int tue) {
		this.tue = tue;
	}
	public int getWed() {
		return wed;
	}
	public void setWed(int wed) {
		this.wed = wed;
	}
	public int getThu() {
		return thu;
	}
	public void setThu(int thu) {
		this.thu = thu;
	}
	public int getFri() {
		return fri;
	}
	public void setFri(int fri) {
		this.fri = fri;
	}
	public int getSat() {
		return sat;
	}
	public void setSat(int sat) {
		this.sat = sat;
	}
	public int getSun() {
		return sun;
	}
	public void setSun(int sun) {
		this.sun = sun;
	}
	public String getmAddr1() {
		return mAddr1;
	}
	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}
	public String getmAddr2() {
		return mAddr2;
	}
	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
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
