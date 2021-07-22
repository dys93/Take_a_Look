package com.fin.app.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	public void insertProduct(Product dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object>map);
	public List<Product> listProduct(Map<String, Object>map);
	
	public void updateHitCount(int pNum) throws Exception;
	
	public Product readProduct (int pNum);
	
	public void updateProduct(Product dto, String pathname) throws Exception;
	public void deleteProduct(int pNum, String pathname) throws Exception;
	
	public List<Product> listCategroy();
	public List<Product> listMainOpt();
	public List<Product> listSubOpt(Map<String, Object>map);
	
	public void insertStoreDetail(Product dto) throws Exception;
	public List<Product> listStoreDetail(Map<String, Object>map);
	public Product readStoreDetail(int storeDetailOptNum);
	public void updateStoreDetail(Product dto) throws Exception;
	public void deleteStoreDetail(int storeDetailOptNum) throws Exception;
	
	public void insertProductImage(Product dto)throws Exception;
	public List<Product> listProductImage(int pNum);
	public Product readProductImage(int pImgNum);
	public void deleteProductImage(Map<String, Object> map) throws Exception;	

	public Product selectedProduct(int pNum);
	
	public Product readMember(String mId);
	
	public void insertOrderProduct(Product dto) throws Exception;
	public void insertStore(Product dto) throws Exception;
	public void insertStoreDetails(Product dto) throws Exception;
	public void insertDelivery(Product dto)throws Exception;
	
	public List<Product>listMileage(String mId);
	public List<Product>useListMileage(String mId);
	
	public void addMileage(Product dto) throws Exception;
	public void usedMileage(Product dto)throws Exception;
	
	public List<ProductReview> listReview(Map<String, Object>map);
	public int rDataCount(Map<String, Object> map);
	
	public void deleteReview(int num, String pathname) throws Exception;
	
	//메인
	public List<Product>listBestProduct();
	public List<Product>listTotProduct();
	public List<Product>listNewProduct();
	
}
