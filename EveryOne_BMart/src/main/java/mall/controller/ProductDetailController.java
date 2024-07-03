package mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;
import mall.model.ProductBean;

@Controller
public class ProductDetailController {

	private final String command = "/detail.mall";
	private final String getPage = "product_detail";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String detail(@RequestParam("pnum") int pnum, Model model) {
		
		ProductBean product = mallDao.getProductInfo(pnum);
		model.addAttribute("product", product);
		
		return getPage;
	}
}
