package com.fin.app.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;

@Service("admin.adminService")
public class AdminServcieImpl implements AdminService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int joinCount(String cDate) {
		int count = 0;
		
		try {
			count = dao.selectOne("adminMain.joinCount", cDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public int salesSum(String sDate) {
		int sum = 0;
		
		try {
			sum = dao.selectOne("adminMain.salesSum", sDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sum;
	}

	@Override
	public int joinTot(Map<String, Object> map) {
		int tot = 0;
		
		try {
			tot = dao.selectOne("adminMain.joinTot", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tot;
	}

	@Override
	public int salesTot(Map<String, Object> map) {
		int tot = 0;
		
		try {
			tot = dao.selectOne("adminMain.salesTot", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tot;
	}

	@Override
	public int reservPet(Map<String, Object> map) {
		int tot = 0;
		
		try {
			tot = dao.selectOne("adminMain.reservPet", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tot;
	}

	@Override
	public List<Admin> bestStore() {
		List<Admin> dto = null;
		
		try {
			dto = dao.selectList("adminMain.bestStore");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int reservCount(String cDate) {
		int count = 0;
		
		try {
			count = dao.selectOne("adminPetsitStatus.reservCount", cDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public int freeDelivCount(String sDate) {
		int count = 0;
		
		try {
			count = dao.selectOne("adminSaleStatus.freeDelivCount", sDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public int normalDelivCount(String sDate) {
		int count = 0;
		
		try {
			count = dao.selectOne("adminSaleStatus.normalDelivCount", sDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<Admin> bestPetsit() {
		List<Admin> dto = null;
		
		try {
			dto = dao.selectList("adminPetsitStatus.bestPetsit");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Admin> bestProduct() {
		List<Admin> dto = null;
		
		try {
			dto = dao.selectList("adminSaleStatus.bestProduct");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int freeDelivTot(Map<String, Object> map) {
		int tot = 0;
		
		try {
			tot = dao.selectOne("adminMain.freeDelivTot", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tot;
	}

	@Override
	public int normalDelivTot(Map<String, Object> map) {
		int tot = 0;
		
		try {
			tot = dao.selectOne("adminMain.normalDelivTot", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tot;
	}
	
}
