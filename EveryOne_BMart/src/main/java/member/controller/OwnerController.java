package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;

@Controller
public class OwnerController {
	
	private final String command = "omain.mb";
	private final String getPage = "/owner/o_main";
	
	
	@RequestMapping(command)
	public String main() {
		return getPage;
	}
} 
