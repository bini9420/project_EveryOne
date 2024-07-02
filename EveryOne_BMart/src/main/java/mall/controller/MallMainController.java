package mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.CategoryBean;
import mall.model.MallDao;
import mall.model.ProductBean;
import mall.model.WatchBean;

@Controller
public class MallMainController {

	private final String command = "/main.mall";
	private final String getPage = "main";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String mall(Model model, HttpSession session) {
		
		List<CategoryBean> categoryLists = mallDao.getAllCategory();
		model.addAttribute("categoryLists", categoryLists);
		
		List<ProductBean> bestProducts = mallDao.getBestProduct();
		System.out.println(bestProducts.size());
		model.addAttribute("bestProducts", bestProducts);
		
		return getPage;
	}
}
