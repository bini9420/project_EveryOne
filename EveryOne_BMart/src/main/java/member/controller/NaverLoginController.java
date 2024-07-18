package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import model.MemberBean;

@Controller
public class NaverLoginController {

	private final String command = "/naverLogin.mb";
	private final String gotoPage = "redirect:/main.mall";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command)
	public String neverLogin(@RequestParam("email") String email, 
							@RequestParam("name") String name,
							HttpSession session) {
		
		System.out.println("name: "+name);
		System.out.println("email: "+email);
		
		String email1 = email.substring(0, email.indexOf('@'));
		String email2 = email.substring(email.indexOf('@')+1, email.length());
		
		MemberBean mb = new MemberBean();
		mb.setId(email1);
		mb.setName(name);
		mb.setEmail1(email1);
		mb.setEmail2(email2);
		
		MemberBean member = memberDao.findMember(mb);
		if(member == null) {
			memberDao.naverInsert(mb);
			session.setAttribute("loginInfo", mb);
		}else {
			session.setAttribute("loginInfo", member);
		}
		return gotoPage;
	}
}
