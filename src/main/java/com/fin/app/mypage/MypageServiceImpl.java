package com.fin.app.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fin.app.common.FileManager;
import com.fin.app.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public Profile getUserDetail(String mId) {
		Profile dto = null;
		try {
			dto = dao.selectOne("mypage.selectDetail", mId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Profile updateUserDetail(Profile dto, String pathname) throws Exception {
		
		try {
			// 데이터 가공
			if(dto.getmTel1().length()!=0 && dto.getmTel2().length()!=0 && dto.getmTel3().length()!=0) {
				dto.setmTel(dto.getmTel1() + "-" + dto.getmTel2() + "-" + dto.getmTel3());
			}
			if(dto.getmEmail1().length()!=0 && dto.getmEmail2().length()!=0) {
				dto.setmEmail(dto.getmEmail1() + "@" + dto.getmEmail2());
			}
			
			// 프로필사진
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				dto.setmProfileImg(saveFilename);
				dao.updateData("mypage.updateProfileImg", dto);
			}
			
			// 테이블이 다르기 때문에 두번 update
			dao.updateData("mypage.updateDetail", dto);
			dao.updateData("mypage.updateNick", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;
	}
	
	@Override
	public boolean updatePwd(Profile dto, String mId) throws Exception {
		
		try {
			// 입력받은 현재 비밀번호와 현재세션의 비밀번호 정보 비교
			String currPwd = dto.getCurrPwd();
			if(currPwd.equals(dao.selectOne("mypage.selectCurrPwd", mId))) {
				
				
				dto.setmId(mId);
				
				// 비밀번호 update
				dao.updateData("mypage.updatePwd", dto);
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return false;
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			
			String type = (String) map.get("type");
			
			if(type.equals("petsit")) {
				result=dao.selectOne("mypage.petsitDataCount", map);
			} else if(type.equals("store")) {
				result=dao.selectOne("mypage.storeDataCount", map);
			} else if(type.equals("mileage")) {
				result=dao.selectOne("mypage.mileageDataCount", map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	@Override
	public List<Store> selectStoreList(Map<String, Object> map) throws Exception {
		List<Store> list = null;
		
		try {
			list = dao.selectList("mypage.selectStoreList", map);
			
			// 주문에 대해서 리뷰가 이미 작성 되어 있는지 확인해서 0,1을 리턴받음.
			for( Store dto : list ) {
				int orderNum = dto.getOrderNum();
				int reviewOk = dao.selectOne("mypage.selectStoreReview", orderNum);
				dto.setReviewOk(reviewOk);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Petsit> selectPetsitList(Map<String, Object> map) throws Exception {
		List<Petsit> list = null;
		
		try {
			list = dao.selectList("mypage.selectPetsitList", map);
			
			// 주문에 대해서 리뷰가 이미 작성 되어 있는지 확인해서 0,1을 리턴받음.
			for( Petsit dto : list ) {
				int orderNum = dto.getOrderNum();
				int reviewOk = dao.selectOne("mypage.selectPetsitReview", orderNum);
				dto.setReviewOk(reviewOk);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

	@Override
	public boolean insertReview(Review dto, String pathname) throws Exception {
		
		boolean b = true;
		
		try {
			// seq 먼저 +1 하기
			int rNum =  dao.selectOne("mypage.seq");
			dto.setrNum(rNum);
			
			// 이미지파일이 없이 리뷰작성 시
			if(dto.getUploads().size() == 0 ) {
				dao.insertData("mypage.insertReview", dto);
				
			// 이미지파일이 1개 이상	5개 이하
			} else if (dto.getUploads().size() < 6 ) {
				dao.insertData("mypage.insertReview", dto);
				
				for(MultipartFile mf: dto.getUploads()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null)continue;
					
					dto.setImagefilename(saveFilename);
					
					insertReviewImage(dto);
				}
				
			// 이미지 파일 5개 초과 시 막음
			} else {
				b = false;
				return b;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return b;
	}
	
	@Override
	public void insertReviewImage(Store dto) throws Exception {
		
		try {
			dao.insertData("mypage.insertReviewImage", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void insertReviewImage(Review dto) throws Exception {
		
		try {
			dao.insertData("mypage.insertReviewImage", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Map<String, Object> readDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String type = "";
		Detail dto = null;
		
		try {
			int orderNum = (int) map.get("orderNum");
			int result = dao.selectOne("mypage.isPetsit", orderNum);
			
			if (result != 0) {	// 검색한 주문번호가 펫시터예약 테이블에 존재하면.
				type = "petsit";
				dto = dao.selectOne("mypage.selectDetailP", orderNum);
			} else {
				type = "store";
				dto = dao.selectOne("mypage.selectDetailS", orderNum);
				// 할인 합계금액 계산
				int totSale;
				if(dto.getDelivType()==0) {
					totSale = 2000+ dto.getuMilePrice();
				} else {
					totSale = dto.getuMilePrice();
				}
				dto.setTotSale(totSale);
			}
			resultMap.put("dto", dto);
			resultMap.put("type", type);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> mileageList(Map<String, Object> map) throws Exception {
		
		Map<String, Object>  resultMap = new HashMap<String, Object>();
		List<Mileage> list = null;
		List<Mileage> list2 = null;
		
		
		try {
			list = dao.selectList("mypage.selectMile", map);
			
			list2 = dao.selectList("mypage.selectAllMile", map);
			int totMile = 0; // 내 마일리지 잔액
			
			for( Mileage dto : list2 ) {
				if(dto.getMileType() == 1) {
					totMile += dto.getMilePrice();
				} else {
					totMile -= dto.getMilePrice();
				}
			}
			
			resultMap.put("list", list);
			resultMap.put("totMile", totMile);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	



}
