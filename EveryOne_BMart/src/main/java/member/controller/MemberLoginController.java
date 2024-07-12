package member.controller;

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

import member.model.MemberDao;
import model.MemberBean;


@Controller
public class MemberLoginController {

	private final String command = "/login.mb";
	private final String getPage = "loginForm";
	private String gotoPage = "redirect:/main.mall";

	@Autowired
	MemberDao memberDao;
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String loginForm() {
		
		//System.out.println(this.getClass()+" GET");
		return getPage;
	}

	
	//loginForm.jsp에서 로그인 클릭
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView loginForm(MemberBean member, HttpSession session, HttpServletResponse response, Model model) {

		
		ModelAndView mav = new ModelAndView();
		
		MemberBean mb = memberDao.getMember(member.getId());  
		System.out.println("mb:" + mb);

		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(mb == null){ // 해당 아이디가 존재하지 않는다.
				out.println("<script>");
				out.println("alert('해당 아이디는 존재하지 않습니다. 아이디를 다시 입력해주세요.');");
				out.println("</script>");
				out.flush();
				return new ModelAndView( getPage ) ;
				
			}else{ // 해당 아이디가 존재한다.
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
			}
		}catch (IOException e) {
			e.printStackTrace();
		}
		return mav;
	}
}
