package admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class adminMainController {

	private final String command = "/adminMain.ad";
	private final String getPage = "a_main";



	@RequestMapping(command)
	public String rangeTest(Model model) {
		
	
		return getPage;
	}

}
