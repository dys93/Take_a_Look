package com.fin.app.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	// 내정보 확인
	public Profile getUserDetail(String mId);
	// 정보수정
	public Profile updateUserDetail(Profile dto, String pathname) throws Exception;
	// 비밀번호 변경
	public boolean updatePwd(Profile dto, String mId) throws Exception;
	// 구매내역 리스트
	public List<Store> selectStoreList(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map);
	
	// 예약내역 리스트
	public List<Petsit> selectPetsitList(Map<String, Object> map) throws Exception;
	
	// 리뷰 작성
	public boolean insertReview(Review dto, String pathname) throws Exception;
	void insertReviewImage(Store dto) throws Exception;
	void insertReviewImage(Review dto) throws Exception;
	
	// 주문 상세 페이지
	public Map<String, Object> readDetail(Map<String, Object> map) throws Exception;
	
	// 마일리지
	public Map<String, Object> mileageList(Map<String, Object> map) throws Exception;
	


}
