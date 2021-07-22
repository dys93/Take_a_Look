package com.fin.app.petsit;

import java.util.List;
import java.util.Map;

public interface PetsitService {
	/////펫시터/////
	
	//글쓰기
	public void insertPetsit(Petsit dto, String pathname) throws Exception;
	//글리스트
	public List<Petsit> listPetsit(Map<String, Object> map);
	//글갯수(for paging)
	public int dataCount(Map<String, Object> map);
	//글보기
	public Petsit readPetsit(int num);
	//글수정
	public void updatePetsit(Petsit dot, String pathname) throws Exception;
	//글삭제
	public void deletePetsit(int num, String pathname, String mId) throws Exception;
	
	//파일insert
	public void insertFile(Petsit dto) throws Exception;
	//파일 list
	public List<Petsit> listFile(int num);
	//파일읽기
	public Petsit readFile(int petImgNum);
	//파일 지우기
	public void deleteFile(Map<String, Object> map) throws Exception;

	/////리뷰/////
	
	//리뷰리스트
	public List<PetsitReview> listReview(Map<String, Object> map);		
	//데이터 개수(for paging)
	public int rDataCount(Map<String, Object> map);
	//글삭제
	public void deleteReview(int num, String pathname) throws Exception;
	
	//파일 list
	public List<PetsitReview> listRFile(int rNum);			
	//파일read
	public PetsitReview readRFile(int rImgNum);
	//파일delete
	public void deleteRFile(Map<String, Object> map) throws Exception;

	
	/////예약/////
	
	//예약 내용 입력하기
	public void insertPetsitReservation(Reservation dto) throws Exception;
	
	
}
