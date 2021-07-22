package com.fin.app.admin.memberManagement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.memberManagement.memberManagementController")
public class MemberManagementController {
	@Autowired
	private MemberManagementService service;
	
	@RequestMapping(value="/admin/memberManagement", method=RequestMethod.GET)
	public String memberManagement(Model model) {
		List<MemberManagement> list = service.listMember();
		
		model.addAttribute("list", list);
		
		return ".admin.memberManagement.memberManagement";
	}
	
	// 회원상세 정보 : AJAX-Text 응답
	@RequestMapping(value="/admin/memberManagement/memberManagementDetail")
	public String detailMember(
			@RequestParam String mId,
			Model model) throws Exception {
		
		MemberManagement dto = service.readMember(mId);
		MemberManagement memberState = service.readMemberState(mId);
		List<MemberManagement> listState = service.listMemberState(mId);

		model.addAttribute("dto", dto);
		model.addAttribute("memberState", memberState);
		model.addAttribute("listState", listState);
		
		return "admin/memberManagement/memberManagementDetail";
	}
	
	@RequestMapping(value="/admin/memberManagement/updateMemberState", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMemberState(
			MemberManagement dto) throws Exception {
		
		String state = "true";
		try {
			// 회원 상태 변경 사항 저장
			service.insertMemberState(dto);
			
			// 회원 활성/비활성 변경
			Map<String, Object> map = new HashMap<>();
			map.put("mId", dto.getmId());
			if(dto.getMsCode()==0) {
				map.put("mState", 0);
			} else {
				map.put("mState", 1);
			}
			service.updateMemberState(map);
			
			if(dto.getMsCode()==0) {
				// 회원 패스워드 실패횟수 초기화
				service.updateFailureCountReset(dto.getmId());
			}
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>(); 
		model.put("state", state);
		
		return model;
	}
	
}
