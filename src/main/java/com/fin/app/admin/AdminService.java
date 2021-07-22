package com.fin.app.admin;

import java.util.List;
import java.util.Map;

public interface AdminService {
	public int joinCount(String cDate);
	public int salesSum(String sDate);
	public int reservCount(String cDate);
	public int freeDelivCount(String sDate);
	public int normalDelivCount(String sDate);
	
	
	public int joinTot(Map<String, Object> map);
	public int salesTot(Map<String, Object> map);
	
	public int reservPet(Map<String, Object> map);
	public int freeDelivTot(Map<String, Object> map);
	public int normalDelivTot(Map<String, Object> map);
	
	public List<Admin> bestStore();
	public List<Admin> bestPetsit();
	public List<Admin> bestProduct();
	
}
