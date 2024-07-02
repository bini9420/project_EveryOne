package mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.MallDao;

@Controller
public class MallMainController {

	private final String command = "/main.mall";
	private final String getPage = "main";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String mall(Model model) {
		
		List<String> categoryLists = mallDao.getAllCategory();
		model.addAttribute("categoryLists", categoryLists);
		
		List<String> bestProducts = mallDao.getBestProduct();
		model.addAttribute("bestProducts", bestProducts);
		return getPage;
	}
}
