package com.fin.app.admin;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.adminController")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@SuppressWarnings("null")
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String method(Model model) {
		Map<String, Object> tMap = new HashMap<String, Object>();
		Map<String, Object> lMap = new HashMap<String, Object>();
		
		tMap.put("sDate", getCurMon());
		tMap.put("eDate", getCurSun());
		
		lMap.put("sDate", getLastMon());
		lMap.put("eDate", getLastSun());
		
		Admin joinThisWeek = new Admin();
		joinThisWeek.setMon(service.joinCount(getCurMon()));
		joinThisWeek.setTue(service.joinCount(getCurTue()));
		joinThisWeek.setWed(service.joinCount(getCurWed()));
		joinThisWeek.setThu(service.joinCount(getCurThu()));
		joinThisWeek.setFri(service.joinCount(getCurFri()));
		joinThisWeek.setSat(service.joinCount(getCurSat()));
		joinThisWeek.setSun(service.joinCount(getCurSun()));
		joinThisWeek.setjTotThisWeek(service.joinTot(tMap));
		
		Admin joinLastWeek = new Admin();
		joinLastWeek.setMon(service.joinCount(getLastMon()));
		joinLastWeek.setTue(service.joinCount(getLastTue()));
		joinLastWeek.setWed(service.joinCount(getLastWed()));
		joinLastWeek.setThu(service.joinCount(getLastThu()));
		joinLastWeek.setFri(service.joinCount(getLastFri()));
		joinLastWeek.setSat(service.joinCount(getLastSat()));
		joinLastWeek.setSun(service.joinCount(getLastSun()));
		joinLastWeek.setjTotLastWeek(service.joinTot(lMap));
		
		Admin storeThisWeek = new Admin();
		storeThisWeek.setMon(service.salesSum(getCurMon()));
		storeThisWeek.setTue(service.salesSum(getCurTue()));
		storeThisWeek.setWed(service.salesSum(getCurWed()));
		storeThisWeek.setThu(service.salesSum(getCurThu()));
		storeThisWeek.setFri(service.salesSum(getCurFri()));
		storeThisWeek.setSat(service.salesSum(getCurSat()));
		storeThisWeek.setSun(service.salesSum(getCurSun()));
		storeThisWeek.setsTotThisWeek(service.salesTot(tMap));
		
		Admin storeLastWeek = new Admin();
		storeLastWeek.setMon(service.salesSum(getLastMon()));
		storeLastWeek.setTue(service.salesSum(getLastTue()));
		storeLastWeek.setWed(service.salesSum(getLastWed()));
		storeLastWeek.setThu(service.salesSum(getLastThu()));
		storeLastWeek.setFri(service.salesSum(getLastFri()));
		storeLastWeek.setSat(service.salesSum(getLastSat()));
		storeLastWeek.setSun(service.salesSum(getLastSun()));
		storeLastWeek.setsTotLastWeek(service.salesTot(lMap));
		
		Admin petThisWeek = new Admin();
		Admin petLastWeek = new Admin();
		
		petThisWeek.setpTotThisWeek(service.reservPet(tMap));
		petLastWeek.setpTotLastWeek(service.reservPet(lMap));
		
		List<Admin> bestStore = service.bestStore();

		model.addAttribute("joinThisWeek", joinThisWeek);
		model.addAttribute("joinLastWeek", joinLastWeek);
		model.addAttribute("storeThisWeek", storeThisWeek);
		model.addAttribute("storeLastWeek", storeLastWeek);
		model.addAttribute("petThisWeek", petThisWeek);
		model.addAttribute("petLastWeek", petLastWeek);
		model.addAttribute("bestStore", bestStore);
		
		return ".admin.main.main";
	}
	
	@RequestMapping(value="/admin/saleStatus", method=RequestMethod.GET)
	public String saleStatus(Model model) {
		Map<String, Object> lMap = new HashMap<String, Object>();
		
		lMap.put("sDate", getLastMon());
		lMap.put("eDate", getLastSun());
		
		Admin freeLastWeek = new Admin();
		freeLastWeek.setMon(service.freeDelivCount(getLastMon()));
		freeLastWeek.setTue(service.freeDelivCount(getLastTue()));
		freeLastWeek.setWed(service.freeDelivCount(getLastWed()));
		freeLastWeek.setThu(service.freeDelivCount(getLastThu()));
		freeLastWeek.setFri(service.freeDelivCount(getLastFri()));
		freeLastWeek.setSat(service.freeDelivCount(getLastSat()));
		freeLastWeek.setSun(service.freeDelivCount(getLastSun()));
		
		Admin normalLastWeek = new Admin();
		normalLastWeek.setMon(service.normalDelivCount(getLastMon()));
		normalLastWeek.setTue(service.normalDelivCount(getLastTue()));
		normalLastWeek.setWed(service.normalDelivCount(getLastWed()));
		normalLastWeek.setThu(service.normalDelivCount(getLastThu()));
		normalLastWeek.setFri(service.normalDelivCount(getLastFri()));
		normalLastWeek.setSat(service.normalDelivCount(getLastSat()));
		normalLastWeek.setSun(service.normalDelivCount(getLastSun()));
		
		List<Admin> bestProduct = service.bestProduct();
		
		freeLastWeek.setFreeDelivTot(service.freeDelivTot(lMap));
		normalLastWeek.setNormalDelivTot(service.normalDelivTot(lMap));
		
		model.addAttribute("freeLastWeek", freeLastWeek);
		model.addAttribute("normalLastWeek", normalLastWeek);
		model.addAttribute("bestProduct", bestProduct);
		
		return ".admin.saleStatus.saleStatus";
	}
	
	@RequestMapping(value="/admin/petsitStatus", method=RequestMethod.GET)
	public String petsitStatus(Model model) {
		Map<String, Object> tMap = new HashMap<String, Object>();
		Map<String, Object> lMap = new HashMap<String, Object>();
		
		tMap.put("sDate", getCurMon());
		tMap.put("eDate", getCurSun());
		
		lMap.put("sDate", getLastMon());
		lMap.put("eDate", getLastSun());
		
		Admin petsitLastWeek = new Admin();
		petsitLastWeek.setMon(service.reservCount(getLastMon()));
		petsitLastWeek.setTue(service.reservCount(getLastTue()));
		petsitLastWeek.setWed(service.reservCount(getLastWed()));
		petsitLastWeek.setThu(service.reservCount(getLastThu()));
		petsitLastWeek.setFri(service.reservCount(getLastFri()));
		petsitLastWeek.setSat(service.reservCount(getLastSat()));
		petsitLastWeek.setSun(service.reservCount(getLastSun()));
		
		Admin petsitThisWeek = new Admin();
		petsitThisWeek.setMon(service.reservCount(getCurMon()));
		petsitThisWeek.setTue(service.reservCount(getCurTue()));
		petsitThisWeek.setWed(service.reservCount(getCurWed()));
		petsitThisWeek.setThu(service.reservCount(getCurThu()));
		petsitThisWeek.setFri(service.reservCount(getCurFri()));
		petsitThisWeek.setSat(service.reservCount(getCurSat()));
		petsitThisWeek.setSun(service.reservCount(getCurSun()));
		
		petsitThisWeek.setpTotThisWeek(service.reservPet(tMap));
		petsitLastWeek.setpTotLastWeek(service.reservPet(lMap));
		
		List<Admin> bestPetsit = service.bestPetsit();
		
		model.addAttribute("petsitLastWeek", petsitLastWeek);
		model.addAttribute("petsitThisWeek", petsitThisWeek);
		model.addAttribute("bestPetsit", bestPetsit);
		
		
		return ".admin.petsitStatus.petsitStatus";
	}
	
	
	public static String getCurMon(){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getCurTue(){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, 1);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getCurWed(){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, 2);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getCurThu(){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, 3);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getCurFri(){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, 4);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getCurSat(){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, 5);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getCurSun(){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, 6);
	 	
	 	return formatter.format(c.getTime());
	}
	
	
	
	public static String getLastMon(){
	 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, -7);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getLastTue(){
	 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, -6);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getLastWed(){
	 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, -5);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getLastThu(){
	 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, -4);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getLastFri(){
	 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, -3);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getLastSat(){
	 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, -2);
	 	
	 	return formatter.format(c.getTime());
	}
	
	public static String getLastSun(){
	 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 	Calendar c = Calendar.getInstance();
	 	c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	 	c.add(Calendar.DATE, -1);
	 	
	 	return formatter.format(c.getTime());
	}
	/*
	public static String getCurSunday(){
 		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd");
 		Calendar c = Calendar.getInstance();
 		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
 		c.add(Calendar.DATE, 7);

 		return formatter.format(c.getTime());
 	}
 	
	public static String getLastSunday(){
 		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd");
 		Calendar c = Calendar.getInstance();
 		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);

 		return formatter.format(c.getTime());
 	} 	
	*/
}
