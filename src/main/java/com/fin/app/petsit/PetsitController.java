package com.fin.app.petsit;


import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fin.app.common.FileManager;
import com.fin.app.common.MyUtil;
import com.fin.app.member.SessionInfo;


@Controller("petsit.petsitController")
@RequestMapping("/petsit/*")
public class PetsitController {
	@Autowired
	private PetsitService service;
	//페이징 처리에 필요
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	/*
	@Autowired
	private MemberService memberservice;
	*/
	@RequestMapping("main")
	public String main() throws Exception {
		return ".petsit.main";
	}
	
	@RequestMapping("payment")
	public String payment() throws Exception {
		return ".petsit.payment";
	}

	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page, //현재페이지. 처음엔 1페이지 보여줌
			@RequestParam(defaultValue="") String addr, 
			@RequestParam(defaultValue="all") String condition, //조건 처음엔 모든조건을 보여줌 

			@RequestParam(value="rows", defaultValue="5") int rows, //한페이지에 5개씩
			HttpServletRequest req, //값을 받아옴
			Model model	//Controller에서 생성한 데이터를 담아서 View로 전달
			) throws Exception {
		
		
		int total_page; //전체 페이지
		int dataCount; //전체 데이터 갯수

		if(req.getMethod().equals("GET")) {
			addr = URLDecoder.decode(addr, "UTF-8");
		}
		

		List<String> conList = null;
		if( ! condition.equals("all") ) {
			String [] ss = condition.split(",");
			conList = Arrays.asList(ss);
		}

		//전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>(); //map객체 생성 //map=인터페이스=선언만가능, 자식=HashMap으로 객체생성 
		map.put("addr", addr);
		map.put("conList", conList);                         //HashMap: Map을 구현. Key와 value를 묶어 하나의 entry로 저장

		
		dataCount = service.dataCount(map);//데이터 갯수 //service->serviceImpl의 dataCount()메소드에 map입력하여 결과 가져옴
		total_page = myUtil.pageCount(rows, dataCount); //총페이지수//myUtil에 있는 pageCount()메소드에  줄수와 총 데이터 갯수 넣어서 결과값 받음
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(total_page < current_page)//만약 현재페이지가 전페 페이지보다 크면
			current_page = total_page; //현재페이지수 = 전체페이지수
		
		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page-1) * rows; //건너뜀 //현재페이지-1*줄수 만큼 
		if(offset <0) offset = 0;
		map.put("offset", offset);//offset(키)에 offset(값)을 map에 저장
		map.put("rows", rows);
		
		//글리스트 
		List<Petsit> list = service.listPetsit(map);
		
		//별명 가져오기 
		
		
		//리스트 글번호 만들기 
		int listNum, n =0;
		for(Petsit dto: list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		//검색일 경우 글번호
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/petsit/list";
		String reservationUrl = cp+"/petsit/reservation?page="+ current_page;
		
		if(addr.length()!=0) {
			query+="&addr="+URLEncoder.encode(addr, "utf-8");
		}
		
		if(query.length() !=0) {
			listUrl = cp+"/petsit/list?" + query;
			reservationUrl = cp+"/petsit/reservation?page="+ current_page + "&" +query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);//myUtil의 페이징()메소드의 결과값 paging으로 받음
				
		model.addAttribute("list", list);
		model.addAttribute("reservationUrl", reservationUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("conList", conList);
		model.addAttribute("addr", addr);

				
		return ".petsit.list";
	}
	
	//글쓰기 폼
	@RequestMapping(value="write", method=RequestMethod.GET )
	public String writeForm(Model model) throws Exception {//model(Controller에서 생성한 데이터를 담아서 View로 전달)을 매개변수로 받음
		model.addAttribute("mode", "write"); //addAttribute()메소드를 이용  view에 데이터를 전달//mode(키), write(값) 쌍으로 전달 =mode가 write 
		return ".petsit.write";
		
	}
	
	//글쓰기 완료(전송)
	@RequestMapping(value="/petsit/write", method=RequestMethod.POST)
	public String writeSubmit(Petsit dto, HttpSession session ) throws Exception {
		//올린 아이디						  //HttpSession인터페이스: Client의 상태값을 서버측에 저장하여 Session 관리			
		SessionInfo info=(SessionInfo)session.getAttribute("member"); //info에 세션에 저장된 값(member의 요소들?) 가져오기
		
		
		//사진파일은 꼭 root(webapp)에 저장해야함 
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+"upload"+File.separator+"petsit";
		
		try {
			dto.setmId(info.getmId()); //세션에 저장된 아이디를 dto에 setmId를 통해 넣음
			service.insertPetsit(dto, pathname); //insertPesit()메소드에 dto, pathname을 전달하여 실행 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/petsit/list";	//글쓰기 완료 후 페이지가 list로 	
	}
	
	//글보기
	@RequestMapping(value="reservation")
	public String article( //글번호,페이지, 검색조건, 세션정보, 모델객체를 가져감
			@RequestParam int petNum,
			@RequestParam String page, 
			@RequestParam(defaultValue="all") String condition, 
			@RequestParam(defaultValue="") String keyword, 
			HttpSession session,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length() !=0) { //검색조건이 있으면
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
			
		//해당 레코드 가져오기
		Petsit dto = service.readPetsit(petNum);
		
		if(dto==null)
			return "redirect:/petsit/list?"+query;
					
		//이미지 파일
		List<Petsit> listFile=service.listFile(petNum);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
	
		model.addAttribute("listFile", listFile);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".petsit.reservation";
	}	

	//글수정
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int petNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
			
		SessionInfo info=(SessionInfo)session.getAttribute("member");
			
		Petsit dto = service.readPetsit(petNum);
		if(dto==null)
			return "redirect:/petsit/list?page="+page;
			
		if(! dto.getmId().equals(info.getmId())) {
			return "redirect:/";
		}
			
		List<Petsit> listFile=service.listFile(petNum);
			
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
			
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");				
			
		return ".petsit.write";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit( 
			Petsit dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"upload"+File.separator+"petsit";
		
		try {
			service.updatePetsit(dto, pathname);
		
		} catch (Exception e) {
		}
			
		return "redirect:/petsit/reservation?page="+page+"&petNum="+dto.getPetNum();
	}

	//글삭제
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(
			@RequestParam int petNum,
			@RequestParam String mId,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"upload"+File.separator+"petsit";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Petsit dto = service.readPetsit(petNum);
		if (dto == null) {
			return "redirect:/petsit/list?page="+page;
		}
		
		if(! dto.getmId().equals(info.getmId())) {
			return "redirect:/";
		}
		
		try {
			service.deletePetsit(petNum, pathname, mId);
		} catch (Exception e) {
		}
		
		return "redirect:/petsit/list?"+query;
	}
	
	//파일삭제
	@RequestMapping(value="deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int petImgNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "upload" + File.separator + "album";
		
		Petsit dto=service.readFile(petImgNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getPetImg(), pathname);
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("field", "petImgNum");
		map.put("petNum", petImgNum);
		service.deleteFile(map);
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("state", "true");
		return model;
	}
	
	
	/////리뷰 part /////	
	
	//리뷰리스트 AJAX - Map을 JSON으로 변환 반환 
	@RequestMapping(value="reviewList")
	@ResponseBody
	public Map<String, Object> ReviewList(
			@RequestParam int petNum,
			@RequestParam(value="pageNo",defaultValue="1") int current_page
			) throws Exception {
		int rows=3;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("petNum", petNum);
		
		int dataCount=service.rDataCount(map);
		int total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
	
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<PetsitReview> reviewList = service.listReview(map);		
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("dataCount", dataCount); //데이터 갯수
		model.put("total_page", total_page); //총 페이지 수 

		model.put("pageNo", current_page);//페이지 번호
		model.put("reviewList", reviewList); //리스트 
		
		
		return model;
	}
	
	
	/////예약 part/////
	
/*
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public String createdSubmit(Reservation dto, HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		try {
			dto.setmId(info.getmId());
			//service.insertPetsitReservation(dto, "reservation");
		} catch (Exception e) {
		}
		
		return "redirect:/petsit/list";
	}
*/
	//예약 완료(전송)
	@RequestMapping(value="payment", method=RequestMethod.POST)
	   public String reservationSubmit(
			   @Parameter Reservation dto, 
			   HttpSession session, 
			   Model model) throws Exception {
	      
		//예약한 아이디                             
	    SessionInfo info=(SessionInfo)session.getAttribute("member"); 
	    
	    //Member member = memberservice.readMember(info.getmId());
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy / MM / dd");		
		Date date = new Date();        
		String dateToStr = dateFormat.format(date);
		
	    try {
	       dto.setmId(info.getmId()); //세션에 저장된 아이디를 dto에 setmId를 통해 넣음
	       dto.setrDate(dateToStr);         
	    } catch (Exception e) {
	       e.printStackTrace();
	    }
	     
	    model.addAttribute("dto", dto);
	    //model.addAttribute("member", member);
	      
	    //완료 후 페이지가 payment로    
	    return ".petsit.payment";  
	   }
	
	//결제
	@RequestMapping(value = "confirm" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> rvConfirm(
			Reservation dto,
			HttpSession session
			){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
				
		String state = "true";
		try {
			dto.setmId(info.getmId());
			service.insertPetsitReservation(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
}
