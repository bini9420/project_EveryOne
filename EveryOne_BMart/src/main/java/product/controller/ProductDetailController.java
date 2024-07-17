package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductDetailController {

	@Autowired
	ProductDao productDao; 

	private final String command = "/prodDetail.prd";
	private final String getPage = "adminPrdView";

	@RequestMapping(value = command)
	public String detailView(
			@RequestParam(value =  "pnum", required = true) int pnum,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam(value="keyword", required = false) String keyword,
			Model model) {
	
			System.out.println(this.getClass());
			System.out.println(pnum);
			System.out.println(pageNumber);
			System.out.println(keyword);
			
			ProductBean pb =  productDao.detailViewByNum(pnum);
			model.addAttribute("product", pb);
			model.addAttribute("pageNumber", pageNumber);
			model.addAttribute("keyword", keyword);
	
			return getPage; // productDetailView
	}
}