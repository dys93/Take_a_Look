package com.fin.app.admin.petsitManagement;

import java.util.List;

public interface PetsitManagementService {
	public void insertPetsit(PetsitManagement dto, String mId) throws Exception;
	
	public PetsitManagement readPetsit(String mId);
	
	public void printPetsit(PetsitManagement dto) throws Exception;
	
	public List<PetsitManagement> listPetsit();
}
