package com.fin.app.stat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fin.app.common.APISerializer;

@Controller("stat.userController")
@RequestMapping("/stat/*")
public class UserController {
	
	@Autowired
	private APISerializer apiSerializer;
	
	@RequestMapping(value="stat")
	public String main() {
		return ".stat.stat";
	}
	
	@RequestMapping(value = "stat", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String animal(@RequestParam String date2) throws Exception {
		String result=null;

		/* String date1="20210601"; */
		int numOfRows=3000;
		int pageNo=1;
		String serviceKey="pxTXjrjVmateW0GnkBeONAQfjToozKbno8wEOjY7y7Fo7Klm%2Fl6oA5u0EwRpgVEFIewRTlHeFDaTcbJCz2RCHQ%3D%3D";
		String spec="http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic";
		spec+="?serviceKey="+serviceKey+"&numOfRows="+numOfRows+"&pageNo="+pageNo;
		spec+="&bgnde="+date2+"&endde="+date2;
		
		result = apiSerializer.receiveXmlToJson(spec);
		
		// System.out.println(result);  
		return result;
	}
}
