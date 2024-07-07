package mall.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.MallDao;

@Controller
public class MypageController {

	private final String command = "/mypage.mall";
	private final String getPage = "mypage";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String mypage() {
		
		return getPage;
	}
	
	
}
