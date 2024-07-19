package member.controller;


import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberDao;

@Controller
public class AdminProfileUpdateController {

	
	private final String command="a_profileUpdate.mb";
	private final String getPage="a_profile";
	
	
	@Autowired
	MemberDao MemberDao;
	
	@Autowired
	ServletContext servletContext;
	
	
	
	
	@RequestMapping(command)
	public String profile() {
		return getPage;
	}
	
}
