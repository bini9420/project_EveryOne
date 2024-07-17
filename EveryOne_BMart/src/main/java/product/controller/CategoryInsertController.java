package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductDao;

@Controller
public class CategoryInsertController {
	private final String command = "cateInsert.prd";
	
	
	@Autowired 
	private ProductDao productDao;
	
	@RequestMapping(command)
	public void insertCate(@RequestParam(value="type", required=false) String type) {
		
		
		productDao.insertCategory(type);  
		
		
		
	}
	
	
	
}
