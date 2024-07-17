package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class CheckBusinessController {

	private final String command  ="/checkBusiness.mb";
	private final String gotoPage = "redirect:/omain.mb";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String checkBusiness(@RequestParam("id") String id, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int cnt = -1;
		cnt = memberDao.checkBusiness(id);
		System.out.println("chackBusiness test");
		if(cnt <= 0) {
			out.append("<script>");
			out.append("alert('입점요청이 승인되지 않아서 사업자 페이지에 접속할 수 없습니다.'); history.back();");
			out.append("</script>");
			return null;
		}
		
		return gotoPage + "?id=" + id;
	}
	
	@RequestMapping("/omain.mb")
	public String omain(@RequestParam("id") String id) {
		System.out.println("omain test");
		return "owner/o_main";
	}
	
}
