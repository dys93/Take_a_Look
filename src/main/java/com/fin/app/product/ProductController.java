package com.fin.app.product;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fin.app.common.FileManager;
import com.fin.app.common.MyUtil;
import com.fin.app.member.Member;
import com.fin.app.member.MemberService;
import com.fin.app.member.SessionInfo;

@Controller("product.productController")
@RequestMapping("/product/*")
public class ProductController {
	//커ㅅㅅ
	@Autowired
	private ProductService service;
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManger;
	
	@RequestMapping("main")
	public String main(
			Model model) throws Exception{

		List<Product> bestProduct = service.listBestProduct();
		
		model.addAttribute("listBestProduct", bestProduct);
		
		
		List<Product> totProduct = service.listTotProduct();
		model.addAttribute("listTotProduct", totProduct);
		
		List<Product> newProduct = service.listNewProduct();
		model.addAttribute("listNewProduct", newProduct);
		
		
		return ".product.productMain";
	}
	
	@RequestMapping("cateList/{category}")
	public String cateList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "title") String condition,
			@RequestParam(defaultValue = "") String keyword,			
			@PathVariable String category,			
			@RequestParam(defaultValue = "0")int storeMainOptNum,
			@RequestParam(defaultValue = "0")int storeSubOptNum,
			HttpServletRequest req,
			HttpSession session,
			Model model				
			) throws Exception{
		Map<String, Object>  map = new HashMap<String, Object>();
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		int rows = 6;
		int total_page = 0;
		int dataCount =0;
		
		map.put("pCateNum", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		map.put("storeMainOptNum", storeMainOptNum);
		map.put("storeSubOptNum", storeSubOptNum);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);		
		
		current_page = current_page > total_page ? total_page : current_page;
		
		int offset = (current_page - 1) * rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);		
		
		List<Product> list = service.listProduct(map);
		
		int listNum, n= 0;
		int pDetailPrice,pPrice,totPrice,pDiscountRate, productPrice =0;
		double discountPrice,discoutNum;
		for(Product dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
			
			//상품 가격 보여주기/할인율 계산
			pDetailPrice= dto.getpDetailPrice();
			pPrice = dto.getpPrice();
			pDiscountRate = dto.getpDiscountRate();
			productPrice = pPrice+pDetailPrice;
			discoutNum = pDiscountRate*0.01;
			discountPrice =(pPrice+pDetailPrice)*discoutNum;
			totPrice = (int) ((pPrice+pDetailPrice)- discountPrice);
			dto.setTotPrice(totPrice);
			dto.setProductPrice(productPrice);
		}		
		
		String cp = req.getContextPath();
		String query = "";
		
		String listUrl = cp+"/product/cateList/"+category;
		String articleUrl = cp+"/product/article?category="+category+"&page="+current_page;
		if(keyword.length()!=0) {
			query += "&condition="+condition+
					"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl += "?"+query;
			articleUrl += "&"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		List<Product> mainOptList = service.listMainOpt();
			
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("storeMainOptNum", storeMainOptNum); 

		List<Product> subOptList = service.listSubOpt(map2);
		 	
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		model.addAttribute("storeMainOptNum", storeMainOptNum);
		model.addAttribute("mainOpts", mainOptList);
		
		model.addAttribute("storeSubOptNum", storeSubOptNum);
		model.addAttribute("subOpts", subOptList);	
		
		
		String title = null;
		
		switch (category) {
		case "1": title ="강아지사료";	break;
		case "2": title ="강아지 외출용품";	break;
		case "3": title ="강아지 장난감";	break;
		case "4": title ="강아지 간식";	break;
		case "5": title ="고양이사료";	break;
		case "6": title ="고양이 외출용품";	break;
		case "7": title ="고양이 장난감";	break;
		case "8": title ="고양이 간식";	break;		
		}
		
		model.addAttribute("title", title);
		model.addAttribute("category", category);
		
		return ".product.cateList";
	}
	
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "title") String condition,
			@RequestParam(defaultValue = "") String keyword,			
			@RequestParam(defaultValue = "0")int category,
			@RequestParam(defaultValue = "0")int storeMainOptNum,
			@RequestParam(defaultValue = "0")int storeSubOptNum,
			HttpServletRequest req,
			HttpSession session,
			Model model	
			) throws Exception{
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		int rows = 6;
		int total_page = 0;
		int dataCount =0;
		
		//페이지
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		map.put("pCateNum", category);
		map.put("storeMainOptNum", storeMainOptNum);
		map.put("storeSubOptNum", storeSubOptNum);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Product> list = service.listProduct(map);
	
		int listNum, n= 0;
		int pDetailPrice,pPrice,totPrice,pDiscountRate,productPrice =0;
		double discountPrice,discoutNum;
		for(Product dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
			
			//상품 가격 보여주기/할인율 계산
			pDetailPrice= dto.getpDetailPrice();
			pPrice = dto.getpPrice();
			pDiscountRate = dto.getpDiscountRate();
			productPrice = pPrice+pDetailPrice;
			discoutNum = pDiscountRate*0.01;
			discountPrice =(pPrice+pDetailPrice)*discoutNum;
			totPrice = (int) ((pPrice+pDetailPrice)- discountPrice);
			dto.setTotPrice(totPrice);
			dto.setProductPrice(productPrice);
		}

		String cp = req.getContextPath();
	
		String query = "";
		
		
		String listUrl = cp+"/product/list?category="+category;
		String articleUrl = cp+"/product/article?category="+category+"&page="+current_page;
		if(keyword.length()!=0) {
			query += "&condition="+condition+
					"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl += "?"+query;
			articleUrl += "&"+query;
		}
		
		
		List<Product> categoryList = service.listCategroy();
		List<Product> mainOptList = service.listMainOpt();
		
		//List<Product> subOptList = service.listSubOpt();
			
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("storeMainOptNum", storeMainOptNum); //?

		List<Product> subOptList = service.listSubOpt(map2);
		String paging = myUtil.paging(current_page, total_page, listUrl);
		 	
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		model.addAttribute("category", category);
		
		model.addAttribute("categorys", categoryList);
		
		model.addAttribute("storeMainOptNum", storeMainOptNum);
		model.addAttribute("mainOpts", mainOptList);
		
		model.addAttribute("storeSubOptNum", storeSubOptNum);
		model.addAttribute("subOpts", subOptList);
		
		
		return ".product.list";
	}

	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(	
				Model model,
				HttpSession session) throws Exception{

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeMainOptNum", null);
		
		//notice에서 참고해서 관리자 이외는 못하게 막기
		List<Product> categoryList = service.listCategroy();
		
		List<Product> mainOptList = service.listMainOpt();
		//List<Product> subOptList = service.listSubOpt(map);
	
		model.addAttribute("mode", "created");
		model.addAttribute("categorys", categoryList);
		model.addAttribute("mainOpts", mainOptList);	

		
		return ".product.created";
	}
	
	@RequestMapping(value = "/product/created", method = RequestMethod.POST)
	public String createdSubmit(Product dto,
			Model model,
			HttpSession session) throws Exception{

		String root = session.getServletContext().getRealPath("/");
		String path = root+"uploads"+File.separator+"product";
		
		try {
			service.insertProduct(dto, path);

		} catch (Exception e) {
			model.addAttribute("mode", "created");
			return".product.created";
		}
				
		return "redirect:/product/list";
	}
	
	@RequestMapping(value = "option", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> optionList(
			@RequestParam int storeMainOptNum
			)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeMainOptNum", storeMainOptNum);
		List<Product> optionList = service.listSubOpt(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("optionList", optionList);
		
		return model;
	}
	
	@RequestMapping(value = "deleteImg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteImg(
			@RequestParam int pImgNum,
			HttpSession session) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "product";
		
		Product dto = service.readProductImage(pImgNum);
		if(dto!=null) {
			fileManger.doFileDelete(dto.getpImgName(), pathname);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", "pImgNum");
		map.put("pNum", pImgNum);
		service.deleteProductImage(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value = "article",  method=RequestMethod.GET)
	public String article(
			@RequestParam int pNum,
			@RequestParam String page,
			@RequestParam int category,
			@RequestParam(defaultValue = "title") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			)throws Exception{
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "category="+category+"&page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		Product dto = service.readProduct(pNum);
		if(dto==null) {
			return "redirect:/product/list?"+query;
		}

        //dto.setpContent(myUtil.htmlSymbols(dto.getpContent()));	
        
        int pDetailPrice= dto.getpDetailPrice();
		int pPrice = dto.getpPrice();
		int pDiscountRate = dto.getpDiscountRate();
		int productPrice = pPrice+pDetailPrice;
		double discoutNum = pDiscountRate*0.01;
		double discountPrice =(pPrice+pDetailPrice)*discoutNum;
		int totPrice = (int) ((pPrice+pDetailPrice)- discountPrice);
		dto.setProductPrice(productPrice);
		dto.setTotPrice(totPrice);
		
		List<Product> listProductImage = service.listProductImage(pNum);
		
		model.addAttribute("listProductImage", listProductImage);
		
		model.addAttribute("pNum", pNum);
		model.addAttribute("category", category);
        model.addAttribute("dto", dto);    
        model.addAttribute("page", page);
        model.addAttribute("query", query);
        
		return ".product.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int pNum,
			@RequestParam String page,
			@RequestParam int category,			
			HttpSession session,
			Model model
			)throws Exception{
		
		Product dto = service.readProduct(pNum);
		if(dto == null) {
			return "redirect:/product/list?category="+category+"&page="+page;
		}	
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeMainOptNum", null);
		List<Product> mainOptList = service.listMainOpt();
		map.put("storeMainOptNum", dto.getStoreMainOptNum());
		List<Product> subOptList = service.listSubOpt(map);

		List<Product> categoryList = service.listCategroy();
		
		List<Product> listImg = service.listProductImage(pNum);

		
		model.addAttribute("dto", dto);
		model.addAttribute("listImg", listImg);
		
		model.addAttribute("pNum", pNum);
		model.addAttribute("categorys", categoryList);		
		model.addAttribute("mainOpts", mainOptList);
		model.addAttribute("subOpts", subOptList);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		model.addAttribute("category", category);		
		
		return ".product.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Product dto,
	
			@RequestParam String page,
			@RequestParam int category,				
			HttpSession session
			)throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"product";
		
		try {
			service.updateProduct(dto, pathname);
		} catch (Exception e) {
		}
		

		return "redirect:/product/article?category="+category+"&page="+page+"&pNum="+dto.getpNum();
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(
			@RequestParam int pNum,
			@RequestParam String page,
			@RequestParam int category,
			@RequestParam(defaultValue = "title") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception{
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "category="+category+"&page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"product";
		
		Product dto = service.readProduct(pNum);
		if(dto == null) {
			return "redirect:/product/list?category="+category+"&page="+page;
		}	
		
		try {
			service.deleteProduct(pNum, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/list?"+query;
	}
	
	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String paymentForm(		
			@RequestParam int pNum,
			@RequestParam int sDetailQty,
			@RequestParam int sum,
			@RequestParam(defaultValue = "0")int storeMainOptNum,
			HttpSession session,
			Model model	
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Product dtto = service.readMember(info.getmId());	
		Product dto = service.selectedProduct(pNum);
		
		if(dto == null) {
			return "redirect:/product/list";
		}
		
		if(dtto==null) {
			session.invalidate();
			return "redirect:/member/login";
		}

		List<Product> listMileage = service.listMileage(info.getmId());
		List<Product> useListMileage = service.useListMileage(info.getmId());
		int s= 0, v=0;
		int n;
		for(Product mile : listMileage) {
			s+=mile.getaMilePrice();
		}
		
		for(Product umile : useListMileage) {
			v+=umile.getuMilePrice();
		}			
		
		
		n=s-v;
		//n=s;
		dto.setTotMile(n);
		

		Member member = memberservice.readMember(info.getmId());
		
		if(member.getmAddr1().length()!=0 && member.getmAddr2().length()!=0) {
			dto.setBuyerAddr(member.getmAddr1()+member.getmAddr2());
		}

		//상품가격 계산
        int pDetailPrice= dto.getpDetailPrice();
		int pPrice = dto.getpPrice();
		int pDiscountRate = dto.getpDiscountRate();
		int productPrice = pPrice+pDetailPrice;
		double discoutNum = pDiscountRate*0.01;
		double discountPrice =(pPrice+pDetailPrice)*discoutNum;
		int totPrice = (int) ((pPrice+pDetailPrice)- discountPrice);
		
		dto.setsDetailPrice(productPrice);
		//dto.setProductPrice(productPrice);
		dto.setTotPrice(totPrice);

		int mil = (int)(sum*0.05);
		dto.setaMilePrice(mil);
		dto.setMiles(mil);

		//배달 날짜 = 주문일자+3일
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());//"MM"+"월"+"dd"+"일"
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		//cal.add(Calendar.DATE, +3);
		String delivery = df.format(cal.getTime());

		dto.setsDelivDate(delivery);
		
		
		List<Product> listProductImage = service.listProductImage(pNum);		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeMainOptNum", storeMainOptNum);
		List<Product> subOptlist = service.listSubOpt(map);
		
		model.addAttribute("storeSubOptNum", subOptlist);
		
		model.addAttribute("listMileage", listMileage);
		model.addAttribute("dtto", dtto);	
		model.addAttribute("listProductImage", listProductImage);
		model.addAttribute("pNum", pNum);
		model.addAttribute("sDetailQty", sDetailQty);
		model.addAttribute("sum", sum);
		model.addAttribute("dto", dto);
		model.addAttribute("member", member);
		return ".product.order";
	}
	
	@ResponseBody
	@RequestMapping(value = "orders")
	public Map<String, Object> storeOrder(
			Product dto,
			HttpSession session
			){
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String state = "true";
		try {
			dto.setmId(info.getmId());
			dto.setmNum(info.getmNum());
			service.insertOrderProduct(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "reviewList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ReviewList(
			@RequestParam int pNum,
			@RequestParam(value="pageNo",defaultValue="1") int current_page
			)throws Exception{
		
		int rows = 3;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNum", pNum);
		
		int dataCount = service.rDataCount(map);
		int total_page = myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page) {
			current_page=total_page;
		}
		int offset = (current_page-1)*rows;
		if(offset < 0)offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<ProductReview> reviewList = service.listReview(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("reviewList", reviewList);
		
		return model;
	}
	
	
	
}
