package com.fin.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;

@Service("home.homeService")
public class HomeServiceImpl implements HomeService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Home> bestStore() {
		List<Home> dto = null;
		
		try {
			dto = dao.selectList("home.bestStore");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Home> bestPetsit() {
		List<Home> dto = null;
		
		try {
			dto = dao.selectList("home.bestPetsit");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
