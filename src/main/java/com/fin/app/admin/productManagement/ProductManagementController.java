package com.fin.app.admin.productManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.productManagement.productManagementController")
public class ProductManagementController {
	@Autowired
	private ProductManagementService service;
	
	@RequestMapping(value="/admin/productManagement", method=RequestMethod.GET)
	public String productManagement(Model model) throws Exception {
		List<ProductManagement> list = service.listProduct();
		
		model.addAttribute("list", list);
		
		return ".admin.productManagement.productManagement";
	}
	
	// 제품상세 정보 : AJAX-Text 응답
	@RequestMapping(value="/admin/productManagement/productManagementDetail")
	public String detailProduct(
			@RequestParam int pNum,
			Model model) throws Exception {
		
		ProductManagement dto = service.readProduct(pNum);

		model.addAttribute("dto", dto);
		
		return "admin/productManagement/productManagementDetail";
	}
	
	@RequestMapping(value="/admin/productManagement/updateProductState", method=RequestMethod.POST)
	@ResponseBody
	public void updateMemberState(
			ProductManagement dto) throws Exception {
		
		try {			
			service.updateProductState(dto);
			
		} catch (Exception e) {
		}
	}
}
