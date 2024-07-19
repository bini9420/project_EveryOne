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

import product.model.ProductBean;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class productListController {
	
	@Autowired
	ProductDao productDao;
	
	private final String command = "/list.prd";
	private final String gotoPage = "prdList";
	
	@RequestMapping(command)
	public String list(@RequestParam(value="whatColumn", required=false) String whatColumn,
						@RequestParam(value="keyword", required=false) String keyword,
						@RequestParam(value="pageNumber", required=false) String pageNumber,
						HttpServletRequest request,
						HttpSession session,
						Model model) {
		
		if(session.getAttribute("loginInfo") == null) {
			 session.setAttribute("destination", "redirect:/list.prd");
			 return "redirect:/login.mb"; }
		else {
			model.MemberBean loginInfo = (model.MemberBean) session.getAttribute("loginInfo");
            String id = loginInfo.getId();
            
            String url = request.getContextPath() + this.command;
            int totalCount;
            Paging pageInfo;
            
            if ("admin".equals(loginInfo.getId())) {
            	Map<String, String> map = new HashMap<String, String>();
        		map.put("whatColumn", whatColumn);
        		map.put("keyword", "%" + keyword + "%");
        		
            	totalCount = productDao.getTotalProductCount(map);
                pageInfo = new Paging(pageNumber, null, totalCount, url, null, null);
                List<model.ProductBean> products = productDao.selectAllProducts(map,pageInfo);
                model.addAttribute("products", products);
                model.addAttribute("isAdmin", true);
            } else {
            	 totalCount = productDao.getProductCount(id);
                 pageInfo = new Paging(pageNumber, null, totalCount, url, null, null);
                 List<model.ProductBean> products = productDao.selectProductsByUser(pageInfo, id);
                 model.addAttribute("products", products);
                 model.addAttribute("isAdmin", false);
            }
            

            model.addAttribute("pageInfo", pageInfo);
            return gotoPage;
		}
	}
}
