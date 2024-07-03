package mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;
import mall.model.ProductBean;
import mall.model.SearchBean;
import utility.Paging;

@Controller
public class ProductListController {

	private final String command = "/plists.mall";
	private final String getPage = "product_lists";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String list(@RequestParam(value="category", required=false) String category,
						@RequestParam(value="range", required=false) String range, 
						@RequestParam(value="pageNumber", required=false) String pageNumber, 
						Model model, HttpServletRequest request) {
		
		
		SearchBean sb = new SearchBean();
		sb.setCategory(category);
		sb.setRange(range);
		
		int totalCount = mallDao.getTotalCount(sb);
		String url = request.getContextPath()+this.command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, category, range, null);
		
		List<ProductBean> plists = mallDao.getProductRange(sb, pageInfo);
		
		model.addAttribute("plists", plists);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("category", category);
		return getPage;
	}
}
