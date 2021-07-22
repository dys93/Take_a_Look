package com.fin.app.admin.orderManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;

@Service("admin.orderManagementService")
public class OrderManagementServiceImpl implements OrderManagementService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<OrderManagement> listOrder() throws Exception {
		List<OrderManagement> list = null;
		
		try {
			list = dao.selectList("adminOrder.listOrder");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public OrderManagement readOrder(int orderNum) {
		OrderManagement dto = null;
		
		try {
			dto = dao.selectOne("adminOrder.readOrder", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateOrderStateIng(int orderNum) {
		try {
			dao.updateData("adminOrder.updateOrderStateIng", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateOrderStateOk(int orderNum) {
		try {
			dao.updateData("adminOrder.updateOrderStateOk", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
