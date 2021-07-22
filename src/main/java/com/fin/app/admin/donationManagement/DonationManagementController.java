package com.fin.app.admin.donationManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.donationManagement.donationManagementController")
public class DonationManagementController {
	@Autowired
	private DonationManagementService service;
	
	@RequestMapping(value="/admin/donationManagement", method=RequestMethod.GET)
	public String donationManagement(Model model) throws Exception {
		List<DonationManagement> list = service.listDonation();
		
		int totalDonation = service.totalDonation();
		
		model.addAttribute("list", list);
		model.addAttribute("totalDonation", totalDonation);
		
		return ".admin.donationManagement.donationManagement";
	}
	
	
}
