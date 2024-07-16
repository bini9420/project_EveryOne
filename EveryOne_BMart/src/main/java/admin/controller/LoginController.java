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
		if(mb == null){ // �ش� ���̵� �������� �ʴ´�.
			out.println("<script>");
			out.println("alert('�ش� ���̵�� �������� �ʽ��ϴ�. ���̵� �ٽ� �Է����ּ���.');");
			out.println("</script>");
			out.flush();
			return new ModelAndView( getPage ) ;
			
		}else{ // �ش� ���̵� �����Ѵ�.
			if(mb.getId().equals("admin")) { //������ ���̵�� ���� ��
				if(mb.getPassword().equals(member.getPassword())) { // ��� ��ġ
					session.setAttribute("loginInfo", mb); // loginInfo:�α����� ����� ����
					return new ModelAndView( gotoPage ) ;
					
				}else { // ��� ����ġ
					System.out.println("��� ����ġ");
					out.println("<script>");
					out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�. ��й�ȣ�� �ٽ� �Է����ּ���.');");
					out.println("</script>");
					out.flush();
					//mav.setViewName(getPage);
					return new ModelAndView( getPage ) ;
				}
			}else {
				out.append("<script>");
				out.append("alert('������ ���̵� �ƴմϴ�. ���̵� �ٽ� �Է����ּ���.')");
				out.append("</script>");
				return new ModelAndView( getPage ) ;
			}
		}
	}
}
