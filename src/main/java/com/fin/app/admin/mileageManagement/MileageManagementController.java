package com.fin.app.admin.mileageManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.mileageManagement.mileageManagementController")
public class MileageManagementController {
	@Autowired
	private MileageManagementService service;
	
	@RequestMapping(value="/admin/mileageManagement", method=RequestMethod.GET)
	public String donationManagement(Model model) throws Exception {
		List<MileageManagement> list = service.listMileage();
		
		model.addAttribute("list", list);
		
		return ".admin.mileageManagement.mileageManagement";
	}
}
