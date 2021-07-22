package com.fin.app.petsit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fin.app.common.FileManager;
import com.fin.app.common.dao.CommonDAO;

@Service("petsit.petsitService")
public class PetsitServiceImpl implements PetsitService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	//글작성
	@Override
	public void insertPetsit(Petsit dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("petsit.seq");
			dto.setPetNum(seq);
			
			dao.insertData("petsit.insertPetsit", dto);
			
			//파일 업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf: dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					
					dto.setPetImg(saveFilename);
					
					insertFile(dto);
				}
			}
			
			//스케줄 업로드
			dao.insertData("petsit.insertPetSchedule", dto);
			
			//petOnoff 업데이트
			dao.updateData("petsit.updateOn", dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	//데이터 갯수
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
			
		try {
			result=dao.selectOne("petsit.dataCount", map); //selectOne() :오직 하나의객체만을 리턴
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
		
	//글리스트
	@Override
	public List<Petsit> listPetsit(Map<String, Object> map) {
		List<Petsit> list=null;
		
		try {
			list=dao.selectList("petsit.listPetsit", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	//글보기
	@Override
	public Petsit readPetsit(int petNum) {
		Petsit dto = null;
		
		try {
			dto=dao.selectOne("petsit.readPetsit", petNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	//글수정
	@Override
	public void updatePetsit(Petsit dto, String pathname) throws Exception {
		try {
			
			dao.updateData("petsit.updatePetsit", dto);
			
			dao.updateData("updateSchedule", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;
					
					dto.setPetImg(saveFilename);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); 
			throw e;
		}
		
	}
	//글삭제
	@Override
	public void deletePetsit(int petNum, String pathname, String mId) throws Exception {
		try {
			//파일 지우기
			List<Petsit> listFile=listFile(petNum);
			if(listFile!=null) {
				for(Petsit dto:listFile) {
					fileManager.doFileDelete(dto.getPetImg(), pathname);
				}
			}
			
			//파일 테이블 내용 지우기
			Map<String, Object> map=new HashMap<String, Object>();		
			map.put("field", "petNum");
			map.put("petNum", petNum);
			deleteFile(map);
			
			dao.deleteData("petsit.deletePetsit",petNum);	
			
			dao.updateData("petsit.updateOff", mId);
											
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	//파일등록
	public void insertFile(Petsit dto) throws Exception {
		try {
			dao.insertData("petsit.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	//파일리스트
	@Override
	public List<Petsit> listFile(int petNum) {
		List<Petsit> listFile=null;
		
		try {
			listFile=dao.selectList("petsit.listFile", petNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}
	//파일보기
	@Override
	public Petsit readFile(int petImgNum) {
		Petsit dto=null;
		
		try {
			dto= dao.selectOne("petsit.readFile", petImgNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	//파일 지우기
	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("petsit.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}
	
	//리뷰리스트
	@Override
	public List<PetsitReview> listReview(Map<String, Object> map) {
		List<PetsitReview> list=null;
		
		try {
			list=dao.selectList("petsit.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//리뷰데이터 갯수
	@Override
	public int rDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("petsit.rDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//리뷰 삭제
	@Override
	public void deleteReview(int rNum, String pathname) throws Exception {
		try {
			dao.deleteData("petsit.deleteReview", rNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	//리뷰사진리스트
	@Override
	public List<PetsitReview> listRFile(int rNum) {
		List<PetsitReview> listFile=null;
		
		try {
			listFile=dao.selectList("review.listFile", rNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	//리뷰사진읽기
	@Override
	public PetsitReview readRFile(int rImgNum) {
		PetsitReview dto=null;
		
		try {
			dto= dao.selectOne("petsit.readFile", rImgNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	//리뷰사진삭제
	@Override
	public void deleteRFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("petsit.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
		
	}
	
	//예약 등록
	@Override
	public void insertPetsitReservation(Reservation dto) throws Exception {
		try {
			int orderSeq=dao.selectOne("petsit.orderSeq");
			dto.setOrderNum(orderSeq); 
			
			dto.setmNum(dao.selectOne("petsit.readMnum", dto.getmId()));
//			dto.setPetNum(dao.selectOne("petsit.readPetNum", dto.getmId()));
			
			dao.insertData("petsit.insertOrderProduct", dto);
			dao.insertData("petsit.insertReservation", dto);
				
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	

	
	
	
}
