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

	
	//loginForm.jsp���� �α��� Ŭ��
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView loginForm(MemberBean member, HttpSession session, HttpServletResponse response, Model model) {

		
		ModelAndView mav = new ModelAndView();
		
		MemberBean mb = memberDao.getMember(member.getId());  
		System.out.println("mb:" + mb);

		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(mb == null){ // �ش� ���̵� �������� �ʴ´�.
				out.println("<script>");
				out.println("alert('�ش� ���̵�� �������� �ʽ��ϴ�. ���̵� �ٽ� �Է����ּ���.');");
				out.println("</script>");
				out.flush();
				return new ModelAndView( getPage ) ;
				
			}else{ // �ش� ���̵� �����Ѵ�.
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
			}
		}catch (IOException e) {
			e.printStackTrace();
		}
		return mav;
	}
}
