package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.AdminDao;

@Controller
public class AdminMainController {

	private final String command = "/adminMain.ad";
	private final String getPage = "a_main";
	
	@Autowired
	AdminDao adminDao;
	
	@RequestMapping(value=command)
	public String adminMain(Model model) {
		int count = adminDao.getWaitDocumentCountForAdmin();
		model.addAttribute("count", count);
		
		return getPage;
	}
}
