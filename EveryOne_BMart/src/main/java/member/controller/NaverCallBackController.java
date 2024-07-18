package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaverCallBackController {
	private final String command = "naverCallback.mb";
	private final String gotoCallback = "naverCallback";
	
	@RequestMapping(command)
	public String gotoCallback(Model model) {
		return gotoCallback;
	}
	
}