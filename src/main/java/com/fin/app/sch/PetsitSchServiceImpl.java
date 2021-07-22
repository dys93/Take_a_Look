package com.fin.app.sch;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fin.app.common.dao.CommonDAO;
import com.fin.app.petsit.Petsit;

@Service("sch.petsitSchService")
public class PetsitSchServiceImpl implements PetsitSchService {
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public void insertSchedule(PetsitSchedule dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PetsitSchedule> listMonth(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PetsitSchedule> listDay(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PetsitSchedule readSchedule(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateSchedule(PetsitSchedule dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSchedule(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Petsit veiwSchedule(String petsiterId) {
		Petsit dto=null;
		
		try {
			dto=dao.selectOne("sch.petsitRead", petsiterId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
