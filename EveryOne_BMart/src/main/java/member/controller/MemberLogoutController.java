package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {

	private final String command = "/logout.mb";
	private final String getPage = "logout";
	
	@RequestMapping(command)
	public String logout() {
		return getPage;
	}
}
