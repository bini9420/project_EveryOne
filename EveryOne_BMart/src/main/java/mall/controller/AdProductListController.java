package mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;
import model.ProductBean;
import model.SearchBean;
import utility.MallPaging;

@Controller
public class AdProductListController {

	private final String command = "/adProductList.mall";
	private final String getPage = "adProductList";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String adProductList(@RequestParam(value="range", required=false) String range, 
								@RequestParam(value="pageNumber", required=false) String pageNumber, 
								Model model, HttpServletRequest request) {
		
		SearchBean sb = new SearchBean();
		sb.setRange(range);
		
		int totalCount = mallDao.getAdProductCount(sb);
		String url = request.getContextPath() + this.command;
		
		MallPaging pageInfo = new MallPaging(pageNumber, null, totalCount, url, null, range, null);
		
		List<ProductBean> adProductList = mallDao.getAdProductList(sb, pageInfo);
		
		model.addAttribute("adProductList", adProductList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("range", range);
		return getPage;
	}
	
}
