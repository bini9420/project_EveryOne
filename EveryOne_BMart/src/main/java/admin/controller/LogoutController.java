package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	
	private final String command="logout.ad";
	private final String getPage="logout";
	
	
	@RequestMapping(command)
	public String logout() {
		return getPage;
	}
	
}
