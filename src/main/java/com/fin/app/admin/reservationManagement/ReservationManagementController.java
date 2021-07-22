package com.fin.app.admin.reservationManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.reservationManagement.reservationManagementController")
public class ReservationManagementController {
	@Autowired
	private ReservationManagementService service;
	
	@RequestMapping(value="/admin/reservationManagement", method=RequestMethod.GET)
	public String reservationManagement(Model model) throws Exception {
		List<ReservationManagement> list = service.listReservation();
		
		model.addAttribute("list", list);
		
		return ".admin.reservationManagement.reservationManagement";
	}
}
