package com.fin.app.sch;

import java.util.List;
import java.util.Map;

import com.fin.app.petsit.Petsit;

public interface PetsitSchService {
	public void insertSchedule(PetsitSchedule dto) throws Exception;
	
	public List<PetsitSchedule> listMonth(Map<String, Object> map) throws Exception;
	public List<PetsitSchedule> listDay(Map<String, Object> map) throws Exception;
	
	public PetsitSchedule readSchedule(int num) throws Exception;
	
	public void updateSchedule(PetsitSchedule dto) throws Exception;
	public void deleteSchedule(Map<String, Object> map) throws Exception;
	
	public Petsit veiwSchedule(String petsiterId) ;
}
