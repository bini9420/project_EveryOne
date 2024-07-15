package member.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import member.model.MemberDao;

@Controller
public class adminProfileController {
	
	
	private final String command = "adProfile.mb";
	private final String getPage = "a_profile";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String profile() {
		
		
		return getPage;
	}
}
