package mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.ProductBean;

@Controller
public class ProductInsertController {
	private final String command = "productInsert.prd";
	private final String getPage = "productInsert";
	
	//GET: o_top.jsp에서 물품등록 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insert() {
		return getPage;
	}

}
