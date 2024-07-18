package member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import member.model.MemberDao;
import model.MemberBean;

@Controller
public class adminProfileController {
	
	
	private final String command = "adProfile.mb";
	private final String getPage = "a_profile";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String profile(HttpSession session,Model model) {
		
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		
		MemberBean adminLists =memberDao.getMember(member.getId());
		System.out.println("adminLists:"+adminLists);
		
		model.addAttribute("adminLists",adminLists);
		
		return getPage;
	}
}
