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
		//일반 결재대기 건수
		int documentCount = adminDao.getWaitDocumentCountForAdmin();
		model.addAttribute("documentCount", documentCount);
		
		return getPage;
	}
}
