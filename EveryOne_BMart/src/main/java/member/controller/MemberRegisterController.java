package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberDao;
import model.MemberBean;

@Controller
public class MemberRegisterController {

	private final String command = "/register.mb";
	private final String getPage = "registerForm";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String register() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String register(@ModelAttribute("member") @Valid MemberBean member, BindingResult result, 
							HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		memberDao.insertMember(member);
		out.append("<script>");
		out.append("alert('회원가입 성공! 로그인 페이지로 이동합니다.'); location.href='login.mb';");
		out.append("</script>");
		out.flush();
		return null;
	}
}
