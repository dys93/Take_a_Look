package com.fin.app.admin.mileageManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;

@Service("admin.mileageManagementService")
public class MileageManagementServiceImpl implements MileageManagementService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<MileageManagement> listMileage() throws Exception {
		List<MileageManagement> list = null;
		
		try {
			list = dao.selectList("adminMileage.listMileage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
