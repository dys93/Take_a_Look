package com.fin.app.product;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	
	private int pNum; //제품코드 
	private int listNum; //리스트번호
	private String pName;//상품명
	private int pPrice;//제품원가
	private int pDiscountRate;//할인율
	private String pContent;//상세정보
	private int delivType;//배송조건
	private String pDate;//등록일	
	private int pCateNum;//카테고리 번호
	private String pCateName; //카테고리명	
	
	private String pImgName;//이미지파일 이름 
	private int pImgNum;//파일번호
	private List<MultipartFile> selectImg; //이미지 파일 업로드

	//제품 옵션들
	private int storeMainOptNum;//상위옵션번호
	private String storeMainOptName;//상위옵션명
	
	private int storeSubOptNum;//하위옵션변호
	private String storeSubOptName;//하위옵션명
	
	private int storeDetailOptNum;//상세옵션번호
	private int pDetailCnt;//상세옵션수량
	private int pDetailPrice;//옵션가격	
	
	private int totPrice; //pPrice+pDetailPrice- discountPrice
	private int discountPrice; //(pPrice+pDetailPrice) * discoutNum
	private int discoutNum; //pDiscountRate *0.01
	private int productPrice;//pPrice+pDetailPrice
	
	private int pdPrice; //결제에서 배송비랑 상품수량에 따른 상품가격 더한 값;
	
	//store
	private int orderNum; //주문코드
	private String sDate; //주문일자
	private int sTotPrice; //주문총금액
	private int sDelivCharge; //배송료
	private String sDelivDate; //배송일자
	private String sZip;//배송지 우편번호
	private String sAddr1;//배송지 주소1
	private String sAddr2;//배송지 주소2
	private int cpNum; //쿠폰번호
	private int usedMileNum; //사용마일리지
	private int addedMileNum; //적립마일리지
	private int finalPrice; //최종결제금액
	
	//orderProduct
	private long mNum; // 고객번호
	private int orderState; // 주문상태
	private String orderName; //구매자 이름
	private String orderTel, tel1, tel2, tel3;//연락처
	private String orderEmail, email1, email2;//이메일
	
	private int sDetailQty;	//주문수량
	private int sDetailPrice; //주문단가
	
	private String mId; //아이디

	private String mName;//회원이름
	private String mTel; //회원전번
	private String mZip; //회원우편
	private String mAddr1; //회원주소1
	private String mAddr2; //회원주소2
	private String mEmail; //회원이메일
	
	private String buyerAddr;

	//사용한 마일리지
	private int totMile;
	private int uMileNum; //마일리지번호
	private int useType; //사용 =0
	private int uMilePrice; //마일리지금액
	private String uMileDate; //날짜
	private String uMileHistory; //내역
	
	//적립할 마일리지
	private int aMileNum; //마일리지번호
	private int addType; //적립=1;
	private int aMilePrice; //마일리지금액
	private String aMileDate; //날짜
	private String aMileHistory; //내역
	private int miles;
	
	//배송
	private int transportNum;
	private int deliveryState;
	
	//메인
	private int rank;
	private int rownum;
	private int sumQty;
	
	
	
	public int getSumQty() {
		return sumQty;
	}

	public void setSumQty(int sumQty) {
		this.sumQty = sumQty;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getTransportNum() {
		return transportNum;
	}

	public void setTransportNum(int transportNum) {
		this.transportNum = transportNum;
	}

	public int getDeliveryState() {
		return deliveryState;
	}

	public void setDeliveryState(int deliveryState) {
		this.deliveryState = deliveryState;
	}

	public int getuMileNum() {
		return uMileNum;
	}

	public void setuMileNum(int uMileNum) {
		this.uMileNum = uMileNum;
	}

	public int getUseType() {
		return useType;
	}

	public void setUseType(int useType) {
		this.useType = useType;
	}

	public int getuMilePrice() {
		return uMilePrice;
	}

	public void setuMilePrice(int uMilePrice) {
		this.uMilePrice = uMilePrice;
	}

	public String getuMileDate() {
		return uMileDate;
	}

	public void setuMileDate(String uMileDate) {
		this.uMileDate = uMileDate;
	}

	public String getuMileHistory() {
		return uMileHistory;
	}

	public void setuMileHistory(String uMileHistory) {
		this.uMileHistory = uMileHistory;
	}

	public int getaMileNum() {
		return aMileNum;
	}

	public void setaMileNum(int aMileNum) {
		this.aMileNum = aMileNum;
	}

	public int getAddType() {
		return addType;
	}

	public void setAddType(int addType) {
		this.addType = addType;
	}

	public int getaMilePrice() {
		return aMilePrice;
	}

	public void setaMilePrice(int aMilePrice) {
		this.aMilePrice = aMilePrice;
	}

	public String getaMileDate() {
		return aMileDate;
	}

	public void setaMileDate(String aMileDate) {
		this.aMileDate = aMileDate;
	}

	public String getaMileHistory() {
		return aMileHistory;
	}

	public void setaMileHistory(String aMileHistory) {
		this.aMileHistory = aMileHistory;
	}

	public int getUsedMileNum() {
		return usedMileNum;
	}

	public void setUsedMileNum(int usedMileNum) {
		this.usedMileNum = usedMileNum;
	}

	public int getAddedMileNum() {
		return addedMileNum;
	}

	public void setAddedMileNum(int addedMileNum) {
		this.addedMileNum = addedMileNum;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmTel() {
		return mTel;
	}

	public void setmTel(String mTel) {
		this.mTel = mTel;
	}

	public String getmZip() {
		return mZip;
	}

	public void setmZip(String mZip) {
		this.mZip = mZip;
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

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
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

	public int getCpNum() {
		return cpNum;
	}

	public void setCpNum(int cpNum) {
		this.cpNum = cpNum;
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


	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getDiscoutNum() {
		return discoutNum;
	}

	public void setDiscoutNum(int discoutNum) {
		this.discoutNum = discoutNum;
	}

	public int getStoreMainOptNum() {
		return storeMainOptNum;
	}

	public void setStoreMainOptNum(int storeMainOptNum) {
		this.storeMainOptNum = storeMainOptNum;
	}

	public String getStoreMainOptName() {
		return storeMainOptName;
	}

	public void setStoreMainOptName(String storeMainOptName) {
		this.storeMainOptName = storeMainOptName;
	}

	public int getStoreSubOptNum() {
		return storeSubOptNum;
	}

	public void setStoreSubOptNum(int storeSubOptNum) {
		this.storeSubOptNum = storeSubOptNum;
	}

	public String getStoreSubOptName() {
		return storeSubOptName;
	}

	public void setStoreSubOptName(String storeSubOptName) {
		this.storeSubOptName = storeSubOptName;
	}

	public int getStoreDetailOptNum() {
		return storeDetailOptNum;
	}

	public void setStoreDetailOptNum(int storeDetailOptNum) {
		this.storeDetailOptNum = storeDetailOptNum;
	}

	public int getpDetailCnt() {
		return pDetailCnt;
	}

	public void setpDetailCnt(int pDetailCnt) {
		this.pDetailCnt = pDetailCnt;
	}

	public int getpDetailPrice() {
		return pDetailPrice;
	}

	public void setpDetailPrice(int pDetailPrice) {
		this.pDetailPrice = pDetailPrice;
	}

	public int getpCateNum() {
		return pCateNum;
	}

	public void setpCateNum(int pCateNum) {
		this.pCateNum = pCateNum;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscountRate() {
		return pDiscountRate;
	}

	public void setpDiscountRate(int pDiscountRate) {
		this.pDiscountRate = pDiscountRate;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpImgName() {
		return pImgName;
	}

	public void setpImgName(String pImgName) {
		this.pImgName = pImgName;
	}

	public int getpImgNum() {
		return pImgNum;
	}

	public void setpImgNum(int pImgNum) {
		this.pImgNum = pImgNum;
	}

	public int getDelivType() {
		return delivType;
	}

	public void setDelivType(int delivType) {
		this.delivType = delivType;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getpCateName() {
		return pCateName;
	}

	public void setpCateName(String pCateName) {
		this.pCateName = pCateName;
	}

	public List<MultipartFile> getSelectImg() {
		return selectImg;
	}

	public void setSelectImg(List<MultipartFile> selectImg) {
		this.selectImg = selectImg;
	}

	public String getpDate() {
		return pDate;
	}

	public void setpDate(String pDate) {
		this.pDate = pDate;
	}

	public int getTotPrice() {
		return totPrice;
	}

	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getPdPrice() {
		return pdPrice;
	}

	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}

	public String getBuyerAddr() {
		return buyerAddr;
	}

	public void setBuyerAddr(String buyerAddr) {
		this.buyerAddr = buyerAddr;
	}

	public long getmNum() {
		return mNum;
	}

	public void setmNum(long mNum) {
		this.mNum = mNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getTotMile() {
		return totMile;
	}

	public void setTotMile(int totMile) {
		this.totMile = totMile;
	}

	public int getMiles() {
		return miles;
	}

	public void setMiles(int miles) {
		this.miles = miles;
	}

	
}
