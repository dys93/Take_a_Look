package com.fin.app.admin.productManagement;

import java.util.List;

public interface ProductManagementService {
	public List<ProductManagement> listProduct() throws Exception;
	
	public ProductManagement readProduct(int pNum);
	
	public void updateProductState(ProductManagement dto) throws Exception;
}
