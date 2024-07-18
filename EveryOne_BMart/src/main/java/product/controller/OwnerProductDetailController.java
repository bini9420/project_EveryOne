package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.ProductBean;
import product.model.ProductDao;

@Controller
public class OwnerProductDetailController {
	private final String command = "prdDetail_owner.prd";
	private final String getPage = "ownerPrdDetailView";
	
	@Autowired
	ProductDao productDao;
	
	//GET: ownerPrdList.jsp���� ���̺� row Ŭ���� �󼼺��� ������ �̵�
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String detail(@RequestParam("pnum") String pnum, Model model) {
		ProductBean pb = productDao.getProductByPnum_Owner(pnum);
		model.addAttribute("product", pb);
		
		return getPage;
	} 
}
