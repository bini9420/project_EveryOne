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

import model.MemberBean;
import model.ProductBean;
import product.model.ProductDao;
import utility.PagingPlus;

@Controller
public class ProductListController {
	private final String command = "productList.prd";
	private final String getPage = "productListForOwner";
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(command)
	public String list(@RequestParam(value="whatColumn", required=false) String whatColumn,
					   @RequestParam(value="inputPname", required=false) String inputPname,
					   @RequestParam(value="inputPnum", required=false) String inputPnum,
					   @RequestParam(value="inputDay1", required=false) String inputDay1,
					   @RequestParam(value="inputDay2", required=false) String inputDay2,
					   @RequestParam(value="pageNumber", required=false) String pageNumber,
					   HttpServletRequest request,
			 		   HttpSession session,
			 		   Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("inputPname", "%" + (inputPname != null ? inputPname : "") + "%");
	    map.put("inputPnum", "%" + (inputPnum != null ? inputPnum : "") + "%");
		map.put("inputDay1", inputDay1);
		map.put("inputDay2", inputDay2);
		map.put("id", mb.getId());
		
		int totalCount = productDao.getTotalCountForOwner(map);
		String url = request.getRequestURI() + this.command;
		
		PagingPlus pageplus = new PagingPlus(pageNumber, null, totalCount, url, whatColumn, inputPname, inputPnum, inputDay1, inputDay2);
		model.addAttribute("pageplus", pageplus);
		 
		List<ProductBean> lists = productDao.getAllProductForOwner(map, pageplus);
		model.addAttribute("lists", lists);
		
		return getPage;
	}
}
