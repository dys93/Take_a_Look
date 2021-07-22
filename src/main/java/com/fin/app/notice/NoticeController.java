package com.fin.app.notice;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

@Controller("notice.noticeController")
@RequestMapping("/center/*")

public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="notice")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 1페이지인 경우 공지리스트 가져오기
        List<Notice> noticeList = null;
        if(current_page==1) {
          noticeList=service.listNoticeTop();
        }
        
        // 리스트에 출력할 데이터를 가져오기
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

        // 글 리스트
        List<Notice> list = service.listNotice(map);

        // 리스트의 번호
        Date endDate = new Date();
        long gap;
        int listNum, n = 0;
        for(Notice dto : list) {
            listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date beginDate = formatter.parse(dto.getnCreated());
/*            
            // 날짜차이(일)
            gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60* 1000);
            dto.setGap(gap);
*/
         // 날짜차이(시간)
            gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);
            dto.setGap(gap);
            
            dto.setnCreated(dto.getnCreated().substring(0, 10));
            
            n++;
        }
        
        String cp=req.getContextPath();
        String query = "";
        String listUrl = cp+"/center/notice";
        String articleUrl = cp+"/center/article?page=" + current_page;
        if(keyword.length()!=0) {
        	query = "condition=" + condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/center/notice?" + query;
        	articleUrl = cp+"/center/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("menuIndex", 4);
		
		return ".center.notice";
	}

	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			Model model,
			HttpSession session
			) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getmId().equals("admin")) {
			return "redirect:/center/notice";
		}
		
		List<Notice> listCategory = service.listCategory();
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "created");
		model.addAttribute("menuIndex", 4);
		
		return ".center.created";
	}

	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(! info.getmId().equals("admin")) {
			return "redirect:/center/notice";	
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";		
			
			dto.setmId(info.getmId());
			service.insertNotice(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/center/notice";
	}

	@RequestMapping(value="article")
	public String article(
			@RequestParam int nNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(nNum);

		Notice dto = service.readNotice(nNum);
		if(dto==null) {
			return "redirect:/center/notice?"+query;
		}
		
        dto.setnContent(dto.getnContent().replaceAll("\n", "<br>"));
         
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("nNum", nNum);

		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
        
		// 파일
		List<Notice> listFile=service.listFile(nNum);
				
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("menuIndex", 4);
		
		return ".center.article";
	}

	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int nNum,
			@RequestParam String page,
			HttpSession session,			
			Model model	) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(! info.getmId().equals("admin")) {
			return "redirect:/center/notice?page="+page;
		}

		Notice dto = service.readNotice(nNum);
		if(dto==null) {
			return "redirect:/center/notice?page="+page;
		}
		
		List<Notice> listFile=service.listFile(nNum);
		List<Notice> listCategory = service.listCategory();
		model.addAttribute("listCategory", listCategory);	
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("menuIndex", 4);
		
		return ".center.created";
	}

	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(
			Notice dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getmId().equals("admin")) {
			return "redirect:/center/list?page="+page;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "notice";		
			
			dto.setmId(info.getmId());
			service.updateNotice(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/center/notice?page="+page;
	}

	@RequestMapping(value="delete")
	public String delete(
			@RequestParam int nNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		if(! info.getmId().equals("admin")) {
			return "redirect:/center/notice?"+query;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";
			service.deleteNotice(nNum, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/center/notice?"+query;
	}

	@RequestMapping(value="download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		boolean b = false;
		
		Notice dto = service.readFile(fileNum);
		if(dto!=null) {
			String saveFilename = dto.getnSaveFile();
			String originalFilename = dto.getnOriginalFile();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value="zipdownload")
	public void zipdownload(
			@RequestParam int nNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		boolean b = false;
		
		List<Notice> listFile = service.listFile(nNum);
		if(listFile.size()>0) {
			String []sources = new String[listFile.size()];
			String []originals = new String[listFile.size()];
			String zipFilename = nNum+".zip";
			
			for(int idx = 0; idx<listFile.size(); idx++) {
				sources[idx] = pathname+File.separator+listFile.get(idx).getnSaveFile();
				originals[idx] = File.separator+listFile.get(idx).getnOriginalFile();
			}
			
			b = fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value="deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int nFileNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		Notice dto=service.readFile(nFileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getnSaveFile(), pathname);
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("field", "nFileNum");
		map.put("nNum", nFileNum);
		service.deleteFile(map);
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("state", "true");
		return model;
	}
}
