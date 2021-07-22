package com.fin.app.admin.orderManagement;

import java.util.List;

public interface OrderManagementService {
	public List<OrderManagement> listOrder() throws Exception;
	
	public OrderManagement readOrder(int orderNum);
	
	public void updateOrderStateIng(int orderNum);
	public void updateOrderStateOk(int orderNum);
}
