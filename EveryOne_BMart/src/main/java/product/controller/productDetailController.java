package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.ProductBBean;
import product.model.ProductBDao;

@Controller
public class productDetailController {

	@Autowired
	ProductBDao productDao;
	
	private final String command = "detail.prd";
	private final String gotoPage = "detail";
	
	@RequestMapping(command)
	public String detail(@RequestParam(value="pnum", required = true) int pnum,
						@RequestParam(value="pageNumber", required=false) String pageNumber,
						@RequestParam(value="whatColumn", required=false) String whatColumn,
						@RequestParam(value="keyword", required=false) String keyword,
						Model model) {
		
		ProductBBean pb = productDao.getProductById(pnum);
		model.addAttribute("product",pb);
		return gotoPage;
	}
	
}
