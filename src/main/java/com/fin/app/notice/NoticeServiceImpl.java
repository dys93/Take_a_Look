package com.fin.app.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fin.app.common.FileManager;
import com.fin.app.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertNotice(Notice dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("notice.seq");
			dto.setnNum(seq);
			dao.insertData("notice.insertNotice", dto);
			
			// 파일 업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;

					String originalFilename=mf.getOriginalFilename();
					long fileSize=mf.getSize();
					
					dto.setnOriginalFile(originalFilename);
					dto.setnSaveFile(saveFilename);
					dto.setnFileSize(fileSize);
					
					insertFile(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("notice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Notice readNotice(int nNum) {
		Notice dto=null;

		try {
			dto=dao.selectOne("notice.readNotice", nNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(int nNum) throws Exception {
		try {
			dao.updateData("notice.updateHitCount", nNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto=null;

		try {
			dto=dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto=null;

		try {
			dto=dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateNotice(Notice dto, String pathname) throws Exception {
		try {
			dao.updateData("notice.updateNotice", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;
					
					String originalFilename=mf.getOriginalFilename();
					long fileSize=mf.getSize();
					
					dto.setnOriginalFile(originalFilename);
					dto.setnSaveFile(saveFilename);
					dto.setnFileSize(fileSize);
					
					insertFile(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteNotice(int nNum, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<Notice> listFile=listFile(nNum);
			if(listFile!=null) {
				for(Notice dto:listFile) {
					fileManager.doFileDelete(dto.getnSaveFile(), pathname);
				}
			}
			
			// 파일 테이블 내용 지우기
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("field", "nNum");
			map.put("nNum", nNum);
			deleteFile(map);
			
			dao.deleteData("notice.deleteNotice", nNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(Notice dto) throws Exception {
		try {
			dao.insertData("notice.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Notice> listFile(int nNum) {
		List<Notice> listFile=null;
		
		try {
			listFile=dao.selectList("notice.listFile", nNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public Notice readFile(int nFileNum) {
		Notice dto=null;
		
		try {
			dto=dao.selectOne("notice.readFile", nFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("notice.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Notice> listCategory() {
		List<Notice> list = null;
		try {
			list = dao.selectList("notice.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
