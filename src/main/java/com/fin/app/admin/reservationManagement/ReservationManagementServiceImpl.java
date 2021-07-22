package com.fin.app.admin.reservationManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;

@Service("admin.reservationManagementService")
public class ReservationManagementServiceImpl implements ReservationManagementService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ReservationManagement> listReservation() throws Exception {
		List<ReservationManagement> list = null;
		
		try {
			list = dao.selectList("adminReservation.listReservation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
