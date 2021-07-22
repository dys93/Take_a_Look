package com.fin.app.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fin.app.common.FileManager;
import com.fin.app.common.dao.CommonDAO;

@Service("product.productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertProduct(Product dto, String pathname) throws Exception {
		
		try {
			int seq = dao.selectOne("product.seq");
			dto.setpNum(seq);
			
			dao.insertData("product.insertProduct", dto);

			insertStoreDetail(dto);
			
			if(! dto.getSelectImg().isEmpty()) {
				for(MultipartFile mf: dto.getSelectImg()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null)continue;
					
					dto.setpImgName(saveFilename);
					
					insertProductImage(dto);
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("product.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("product.listProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateHitCount(int pNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Product readProduct(int pNum) {
		Product dto = null;
		
		try {
			dto = dao.selectOne("product.readProduct", pNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateProduct(Product dto, String pathname) throws Exception {
		
		
		try {
			dao.updateData("product.updateProduct", dto);
			
			updateStoreDetail(dto);
			
			if(! dto.getSelectImg().isEmpty()) {
				for(MultipartFile mf: dto.getSelectImg()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null)continue;
					
					dto.setpImgName(saveFilename);
					
					insertProductImage(dto);
				}
			}				
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteProduct(int pNum, String pathname) throws Exception {
	
		try {
			
			List<Product> listProductImage = listProductImage(pNum);
			if(listProductImage != null) {
				for(Product dto: listProductImage) {
					fileManager.doFileDelete(dto.getpImgName(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "pNum");
			map.put("pNum", pNum);
			deleteProductImage(map);
			
			dao.deleteData("product.deleteProduct", pNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}

	@Override
	public List<Product> listCategroy() {
		List<Product> list = null;
		
		try {
			list = dao.selectList("product.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<Product> listMainOpt() {
		List<Product> list = null;
		
		try {
			list = dao.selectList("product.listMainOpt");
		} catch (Exception e) {
			e.printStackTrace();
		}			
		return list;
	}


	@Override
	public List<Product> listSubOpt(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("product.listSubOpt", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertStoreDetail(Product dto) throws Exception {
		
		try {
			dao.insertData("product.insertStoreDetail", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}	
	
	@Override
	public List<Product> listStoreDetail(Map<String, Object>map) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("product.listStoreDetail", map);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return list;
	}
	
	
	@Override
	public Product readStoreDetail(int storeDetailOptNum) {
		Product dto = null;
		
		try {
			dto = dao.selectOne("product.readStoreDetail", storeDetailOptNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return dto;
	}
	
	@Override
	public void updateStoreDetail(Product dto) throws Exception {
		
		try {
			dao.updateData("product.updateStoreDetail", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteStoreDetail(int storeDetailOptNum) throws Exception {
		
		try {
			dao.deleteData("product.deleteStoreDetail", storeDetailOptNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void insertProductImage(Product dto) throws Exception {
		
		try {
			dao.insertData("product.insertProductImage", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}		
	
	@Override
	public List<Product> listProductImage(int pNum) {
		List<Product> listProductImage = null;
		
		try {
			listProductImage = dao.selectList("product.listProductImage", pNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listProductImage;
	}

	@Override
	public Product readProductImage(int pImgNum) {
		Product dto = null;
		
		try {
			dto = dao.selectOne("product.readProductImage", pImgNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteProductImage(Map<String, Object> map) throws Exception {
		
		try {
			dao.deleteData("product.deleteProductImage", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;		
		}
	}


	@Override
	public Product selectedProduct(int pNum) {
		Product dto = null;
		
		try {
			dto = dao.selectOne("product.selectedProduct", pNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}


	@Override
	public Product readMember(String mId) {
		Product dto = null;
		
		try {
	
			dto = dao.selectOne("product.readMember", mId);
			
			if(dto!=null) {
				if(dto.getmEmail()!=null) {
					String [] s = dto.getmEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}
				
				if(dto.getmTel()!=null) {
					String [] s = dto.getmTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public void insertOrderProduct(Product dto) throws Exception {
		
		try {
			
			if(dto.getEmail1().length()!=0 && dto.getEmail2().length()!=0) {
				dto.setmEmail(dto.getEmail1()+"@"+dto.getEmail2());
				dto.setOrderEmail(dto.getEmail1()+"@"+dto.getEmail2());
			}
			if(dto.getTel1().length()!=0 && dto.getTel2().length()!=0 && dto.getTel3().length()!=0) {
				dto.setmTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
				dto.setOrderTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
			}
			
			int orderSeq = dao.selectOne("product.orderSeq");
			dto.setOrderNum(orderSeq);
			dao.insertData("product.insertOrderProduct", dto);
			
			
			addMileage(dto);
			insertStore(dto);
			insertStoreDetails(dto);
			usedMileage(dto);
			insertDelivery(dto);
			if(dto.getuMilePrice()!=0) {
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void insertStore(Product dto) throws Exception {
				
		try {
			dao.insertData("product.insertStore", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void insertStoreDetails(Product dto) throws Exception {
		
		try {
			dao.insertData("product.insertStoreDetails", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void insertDelivery(Product dto) throws Exception {
		
		try {
			dao.insertData("product.insertDelivery", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

	@Override
	public List<Product> listMileage(String mId) {
		List<Product> listMileage = null;
		
		try {
			listMileage = dao.selectList("product.listMileage", mId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return listMileage;
	}


	@Override
	public void addMileage(Product dto) throws Exception {
		
		try {
			int addMileSeq = dao.selectOne("product.addMileSeq");
			dto.setaMileNum(addMileSeq);
			dao.insertData("product.addMileage", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	@Override
	public List<Product> useListMileage(String mId) {
		List<Product> useListMileage = null;
		
		try {
			useListMileage = dao.selectList("product.useListMileage", mId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return useListMileage;
	}
	
	@Override
	public void usedMileage(Product dto) throws Exception {
		
		try {
			dao.insertData("product.usedMileage", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



	//리뷰
	@Override
	public List<ProductReview> listReview(Map<String, Object> map) {
		List<ProductReview> listReview = null;
		
		try {
			listReview = dao.selectList("product.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return listReview;
	}


	@Override
	public int rDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("product.rDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public void deleteReview(int rNum, String pathname) throws Exception {
		
		
	}


	@Override
	public List<Product> listBestProduct() {
		List<Product> dto = null;
		
		try {
			dto = dao.selectList("product.listBestProduct");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public List<Product> listTotProduct() {
		List<Product> dto = null;
		
		try {
			dto = dao.selectList("product.listTotProduct");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public List<Product> listNewProduct() {
		List<Product> dto = null;
		
		
		try {
			dto = dao.selectList("product.listNewProduct");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}





}
