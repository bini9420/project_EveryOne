package mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.MallDao;
import model.ProductBean;

@Controller
public class BestProductListController {

	private final String command = "/bestLists.mall";
	private final String getPage = "bestProductList";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String bestList(Model model, HttpServletRequest request) {
		
		List<ProductBean> plists = mallDao.getBestProduct();
		
		model.addAttribute("plists", plists);
		return getPage;
	}
}