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
import model.ProductBean;
import model.SearchBean;
import utility.MallPaging;

@Controller
public class ProductListController {

	private final String command = "/plists.mall";
	private final String getPage = "productLists";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String list(@RequestParam(value="category", required=false) String category,
						@RequestParam(value="range", required=false) String range, 
						@RequestParam(value="keyword", required=false) String keyword,
						@RequestParam(value="pageNumber", required=false) String pageNumber, 
						Model model, HttpServletRequest request) {
		
		System.out.println("category: "+category);
		
		if(category != null) { //카테고리를 클릭했을 때 상품 조회
			SearchBean sb = new SearchBean();
			sb.setCategory(category);
			sb.setRange(range);
			
			int totalCount = mallDao.getTotalCount(sb);
			String url = request.getContextPath()+this.command;
			
			MallPaging pageInfo = new MallPaging(pageNumber, null, totalCount, url, category, range, null);
			
			List<ProductBean> plists = mallDao.getProductRange(sb, pageInfo);
			
			model.addAttribute("plists", plists);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("category", category);
			model.addAttribute("range", range);
			
		}else {
			if(keyword == null) { //신상품 조회
				SearchBean sb = new SearchBean();
				sb.setRange(range);
				
				int totalCount = mallDao.getNewProductCount(sb);
				String url = request.getContextPath()+this.command;
				
				MallPaging pageInfo = new MallPaging(pageNumber, null, totalCount, url, null, range, null);
				
				List<ProductBean> plists = mallDao.getNewProductRange(sb, pageInfo);
				
				model.addAttribute("plists", plists);
				model.addAttribute("pageInfo", pageInfo);
				model.addAttribute("range", range);
				
			}else { //검색을 통한 상품 조회
				SearchBean sb = new SearchBean();
				sb.setKeyword("%"+keyword+"%");
				sb.setRange(range);
				
				System.out.println("keyword: "+sb.getKeyword());
				
				int totalCount = mallDao.getKeywordCount(sb);
				String url = request.getContextPath()+this.command;
				
				MallPaging pageInfo = new MallPaging(pageNumber, null, totalCount, url, null, range, keyword);
				List<ProductBean> plists = mallDao.getKeywordRange(sb, pageInfo);
				
				model.addAttribute("plists", plists);
				model.addAttribute("pageInfo", pageInfo);
				model.addAttribute("keyword", keyword);
				model.addAttribute("range", range);
			}
		}
		return getPage;
	}
}
