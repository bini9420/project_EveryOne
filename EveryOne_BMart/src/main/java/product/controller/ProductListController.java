package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.ProductBean;
import product.model.ProductDao;
import utility.MemberListPaging;

@Controller
public class ProductListController {

	private final String command = "productList.prd";
	private final String getPage = "adminPrdList";

	@Autowired
	ProductDao productDao; 

	@RequestMapping(command)
	public String list(

			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request,
			Model model,
			HttpSession session
			) {


		System.out.println("keyword"+keyword);

		Map<String, String> map = new HashMap<String, String>();


		if (keyword != null && !keyword.trim().isEmpty()) {
			map.put("keyword", "%" + keyword + "%");
		} else {
			map.put("keyword", null);
		}


		int totalCount = productDao.getTotalCount(map);                
		String url = request.getContextPath() + "/"+this.command;

		MemberListPaging pageInfo = new MemberListPaging(pageNumber, null, totalCount, url,  keyword);
		List<ProductBean> productLists = productDao.getProductList(map, pageInfo);

		model.addAttribute("productLists", productLists);
		model.addAttribute("pageInfo", pageInfo);

		return getPage;
	}
}

