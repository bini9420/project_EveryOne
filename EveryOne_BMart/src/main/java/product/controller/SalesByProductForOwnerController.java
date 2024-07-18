package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import product.model.ProductDao;

@Controller
public class SalesByProductForOwnerController {

	private final String command = "owner_prdSales.prd";
	private final String getPage = "ownerSalesByProduct";
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(command)
	public String sales() {
		return getPage;
	}
	
}
