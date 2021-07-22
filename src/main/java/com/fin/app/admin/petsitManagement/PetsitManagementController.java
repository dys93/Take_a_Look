package com.fin.app.admin.petsitManagement;

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

@Controller("admin.petsitManagement.petsitManagementController")
public class PetsitManagementController {
	@Autowired
	private PetsitManagementService service;
	
	@RequestMapping(value="/admin/petsitManagement", method=RequestMethod.GET)
	public String petstiManagement(Model model) {
		
		List<PetsitManagement> list = service.listPetsit();

		model.addAttribute("list", list);
		
		return ".admin.petsitManagement.petsitManagement";
	}
	
	@RequestMapping(value="/admin/petsitManagement/petsitManagementDetail")
	public String detailPetsit(
			@RequestParam String mId,
			Model model) throws Exception {
		
		PetsitManagement dto = service.readPetsit(mId);

		model.addAttribute("dto", dto);
		
		return "admin/petsitManagement/petsitManagementDetail";
	}
	
	@RequestMapping(value="/admin/petsitAdd", method=RequestMethod.POST)
	@ResponseBody
	public void petsitAdd(PetsitManagement dto, @RequestParam String mId) {
		try {
			service.insertPetsit(dto, mId);
		} catch (Exception e) {
		}
	}
	
	@RequestMapping(value="/admin/petsitPrint", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> petsitPrint(PetsitManagement dto) {
		try {
			service.printPetsit(dto);
		} catch (Exception e) {
		}
		
		Map<String, Object> model = new HashMap<>();
		 
		String petStart = String.format("%1$tY-%1$tm-%1$td", dto.getPetStart());
		
		model.put("mId", dto.getmId());
		model.put("mPwd", dto.getmPwd());
		model.put("mNick", dto.getmNick());
		model.put("petStart", petStart);
		
		return model;
	}

}
