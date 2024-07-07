package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;


@Controller
public class MemberLoginController {

	private final String command = "/loginForm.mb";
	private final String getPage = "loginForm";



	@Autowired
	MemberDao memberDao;


	@RequestMapping(value=command, method=RequestMethod.GET) 
	public String loginForm() {

		System.out.println(this.getClass()+" GET"); 
		return getPage; 
	}

	/*
	 * @RequestMapping(value=command) public ModelAndView login(MemberBean member,
	 * HttpServletRequest request,Model model) { MemberBean mb =
	 * memberDao.getMember(member.getId()); HttpSession session =
	 * request.getSession(); if(mb!=null) { session.setAttribute("loginInfo",mb);
	 * return new ModelAndView( (String)session.getAttribute("destination") ) ;
	 * }else { session.setAttribute("loginInfo", null); return new ModelAndView(
	 * getPage );
	 * 
	 * } }
	 */


	//loginForm.jsp���� �α��� Ŭ��
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView loginForm(MemberBean member, HttpSession session,HttpServletResponse response,Model model

			) {


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
					System.out.println("��� ��ġ");
					System.out.println("destination:"+(String)session.getAttribute("destination"));


					String adminMainPage = "redirect:/adminMain.jsp"; // ������ ���� ������ URL

					return new ModelAndView(adminMainPage);


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
	@RequestMapping("logout.mb")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginForm.mb";
	}
}
