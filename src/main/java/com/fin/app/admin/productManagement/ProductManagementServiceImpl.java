package com.fin.app.admin.productManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;

@Service("admin.productrManagementService")
public class ProductManagementServiceImpl implements ProductManagementService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ProductManagement> listProduct() throws Exception {
		List<ProductManagement> list = null;
		
		try {
			list = dao.selectList("adminProduct.listProduct");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProductManagement readProduct(int pNum) {
		ProductManagement dto = null;
		
		try {
			dto = dao.selectOne("adminProduct.readProduct", pNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateProductState(ProductManagement dto) throws Exception {
		try {
			dao.updateData("adminProduct.updateProductState", dto);
			dao.updateData("adminProduct.updateProductDetail", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
