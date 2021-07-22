package com.fin.app.admin.orderManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.orderManagement.orderManagementController")
public class OrderManagementController {
	@Autowired
	private OrderManagementService service;
	
	@RequestMapping(value="/admin/orderManagement", method=RequestMethod.GET)
	public String orderManagement(Model model) throws Exception {
		List<OrderManagement> list = service.listOrder();
		
		model.addAttribute("list", list);
		
		return ".admin.orderManagement.orderManagement";
	}
	
	@RequestMapping(value="/admin/orderManagement/orderManagementDetail")
	public String detailOrder(
			@RequestParam int orderNum,
			Model model) throws Exception {
		
		OrderManagement dto = service.readOrder(orderNum);

		model.addAttribute("dto", dto);
		
		return "admin/orderManagement/orderManagementDetail";
	}
	
	@RequestMapping(value="/admin/orderManagement/updateOrderStateIng", method=RequestMethod.POST)
	@ResponseBody
	public void updateOrderStateIng(
			@RequestParam int orderNum
			) throws Exception {
		
		try {
			// 배송준비 -> 배송중
			service.updateOrderStateIng(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admin/orderManagement/updateOrderStateOk", method=RequestMethod.POST)
	@ResponseBody
	public void updateOrderStateOk(
			@RequestParam int orderNum
			) throws Exception {
		
		try {
			// 배송중 -> 배송완료
			service.updateOrderStateOk(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
