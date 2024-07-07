package mall.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;

@Controller
public class MypageController {

	private final String command = "/mypage.mall";
	private final String getPage = "mypage";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String mypage(@RequestParam(value="index", required=false) String index, 
						HttpSession session, Model model) throws IOException {
		
		if(index != null) { //� ��ư�� �����ߴ����� ���� �ٸ� ����� ����
			model.addAttribute("index", index);
			
		}
		return getPage;
	}
	
}
