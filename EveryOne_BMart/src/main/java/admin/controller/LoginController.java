package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import document.model.DocumentDao;
import model.MemberBean;

@Controller
public class LoginController {

	private final String command = "/login.ad";
	private final String getPage = "adminLoginForm";
	private final String gotoPage = "redirect:/adminMain.ad";
	
	@Autowired
	AdminDao adminDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String adminLogin() {
		
		//System.out.println(this.getClass()+" GET");
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView loginForm(MemberBean member, HttpSession session, HttpServletResponse response, Model model) throws IOException {
		
		MemberBean mb = adminDao.getMember(member.getId());  
		System.out.println("mb:" + mb);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(mb == null){ // 해당 아이디가 존재하지 않는다.
			out.println("<script>");
			out.println("alert('해당 아이디는 존재하지 않습니다. 아이디를 다시 입력해주세요.');");
			out.println("</script>");
			out.flush();
			return new ModelAndView( getPage ) ;
			
		}else{ // 해당 아이디가 존재한다.
			if(mb.getId().equals("admin")) { //관리자 아이디랑 같을 때
				if(mb.getPassword().equals(member.getPassword())) { // 비번 일치
					session.setAttribute("loginInfo", mb); // loginInfo:로그인한 사람의 정보
					return new ModelAndView( gotoPage ) ;
					
				}else { // 비번 불일치
					System.out.println("비번 불일치");
					out.println("<script>");
					out.println("alert('비밀번호가 일치하지 않습니다. 비밀번호를 다시 입력해주세요.');");
					out.println("</script>");
					out.flush();
					//mav.setViewName(getPage);
					return new ModelAndView( getPage ) ;
				}
			}else {
				out.append("<script>");
				out.append("alert('관리자 아이디가 아닙니다. 아이디를 다시 입력해주세요.')");
				out.append("</script>");
				return new ModelAndView( getPage ) ;
			}
		}
	}
}
