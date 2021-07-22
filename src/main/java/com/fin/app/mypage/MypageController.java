package com.fin.app.mypage;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fin.app.common.MyUtil;
import com.fin.app.member.SessionInfo;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	private MypageService service;
	@Autowired
	private MyUtil myUtil;
	
	// profile.jsp
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(
			HttpSession session,
			Model model
			) throws Exception {
		
		Profile dto = new Profile();
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto = service.getUserDetail(info.getmId());
			
			model.addAttribute("dto", dto);
		} catch (Exception e) {
		}
		return ".mypage.profile";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String ProfileSubmit(
			HttpSession session,
			Profile dto
			) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setmId(info.getmId());
			
			String root = session.getServletContext().getRealPath("/");
			String pathname =root+"upload"+File.separator+"profileImages";
			
			service.updateUserDetail(dto, pathname);
		} catch (Exception e) {
		}
		
		
		return "redirect:/mypage/profile";
	}
	
	
	// changePwd.jsp
	@RequestMapping(value = "changePwd", method = RequestMethod.GET)
	public String changePwd() throws Exception {
		
		return ".mypage.changePwd";
	}
	
	@RequestMapping(value = "changePwd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changePwdSubmit(
			HttpSession session,
			Profile dto
			) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String currId = info.getmId();
			
			if(service.updatePwd(dto, currId)) {
				
				// 로그아웃
				session.removeAttribute("member");
				session.invalidate();
				
				result.put("state", "true");
				return result;
			}
			
			result.put("state", "false");
			
		} catch (Exception e) {
		}

		return result;
	}
	
	// storeList.jsp
	@RequestMapping(value = "storeList", method = RequestMethod.GET)
	public String storeList(
			Model model,
			HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req
			) throws Exception {
		
		int rows = 8;
		int total_page, dataCount;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int mNum = (int) info.getmNum();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mNum", mNum);
		map.put("type", "store");
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if(total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * rows;
		if(offset<0) offset=0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		String cp = req.getContextPath();
		
		String listUrl = cp+"/mypage/storeList";
		
		
		List<Store> list = service.selectStoreList(map);
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".mypage.storeList";
	}
	
	
	// petsitList.jsp
	@RequestMapping(value = "petsitList", method = RequestMethod.GET)
	public String petsitList(
			Model model,
			HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req
			) throws Exception {
		
		int rows = 8;
		int total_page, dataCount;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int mNum = (int) info.getmNum();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mNum", mNum);
		map.put("type", "petsit");
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if(total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * rows;
		if(offset<0) offset=0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Petsit> list = service.selectPetsitList(map);
		
		String cp = req.getContextPath();
		
		String listUrl = cp+"/mypage/petsitList";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".mypage.petsitList";
	}
	
	// review 작성
	@RequestMapping(value = "review", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> review(
			HttpSession session,
			Review dto
			) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String currId = info.getmId();
			dto.setmId(currId);
			
			String root = session.getServletContext().getRealPath("/");
			String path = root+"upload"+File.separator+"reviewImages";
			
			boolean b = service.insertReview(dto, path);
			
			result.put("state", b);
			
		} catch (Exception e) {
		}
		
		return result;
	}
	
	// orderList.jsp
	@RequestMapping(value = "orderDetail", method = RequestMethod.POST)
	public String orderDetail(
			Model model,
			@RequestParam("orderNum") int orderNum
			) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNum", orderNum);
		
		map = service.readDetail(map);
		
		Detail dto = (Detail) map.get("dto");
		String type = (String) map.get("type");
		
		model.addAttribute("dto", dto);
		model.addAttribute("type", type);
		
		return ".mypage.orderDetail";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "mileage")
	public String mileage(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(value="rows", defaultValue="10") int rows,
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String mId = info.getmId();
		
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("mId", mId);
		map.put("type", "mileage");

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap = service.mileageList(map);
        
        // 보유 마일리지
        int totMile = (int) resultMap.get("totMile");
        // 리스트
        List<Mileage> list = (List<Mileage>) resultMap.get("list");
        
        String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/mypage/mileage";

		if (keyword.length() != 0) {
			query += "&keyword="
					+ URLEncoder.encode(keyword, "UTF-8");
		}
		listUrl += "?" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("totMile", totMile);
		
		model.addAttribute("rows", rows);
		model.addAttribute("keyword", keyword);
        
		
		
		
		
		return ".mypage.mileage";
	}
	
}
