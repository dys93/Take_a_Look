package com.fin.app.admin.memberManagement;

import java.util.List;
import java.util.Map;

public interface MemberManagementService {
	public List<MemberManagement> listMember();
	
	public MemberManagement readMember(String mId);
	
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateMemberState(Map<String, Object> map) throws Exception;
	public void insertMemberState(MemberManagement dto) throws Exception;
	
	public List<MemberManagement> listMemberState(String mId);
	public MemberManagement readMemberState(String mId);
}
