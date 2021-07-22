package com.fin.app.admin.memberManagement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;

@Service("admin.memberManagementService")
public class MemberManagementServiceImpl implements MemberManagementService {
	@Autowired
	private CommonDAO dao;	
	
	@Override
	public List<MemberManagement> listMember() {
		List<MemberManagement> list = null;
		
		try {
			list = dao.selectList("adminMember.listMember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MemberManagement readMember(String mId) {
		MemberManagement dto = null;
		
		try {
			dto=dao.selectOne("adminMember.readMember", mId);
			
			if(dto!=null) {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<MemberManagement> listMemberState(String mId) {
		List<MemberManagement> list = null;
		try {
			list=dao.selectList("adminMember.listMemberState", mId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MemberManagement readMemberState(String mId) {
		MemberManagement dto = null;
		
		try {
			dto=dao.selectOne("adminMember.readMemberState", mId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		// 패스워드 실패횟수 초기화
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberState(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("adminMember.updateMemberState", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertMemberState(MemberManagement dto) throws Exception {
		try {
			dao.updateData("adminMember.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
