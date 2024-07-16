package product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductInsertByOwnerController {
	private final String command = "productInsert_owner.prd";
	private final String getPage = "productInsertForm";
	private final String gotoPage = "redirect:/omain.mb";

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(command)
	public String insert(ProductBean product) {
		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/uploadImage/");
		
		int cnt = -1;
		cnt = productDao.insertProductByOwner(product);
		
		if(cnt > 0) {
			File destination = new File(uploadPath+File.separator+multi.getOriginalFilename());
			try {
				multi.transferTo(destination);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			return getPage;
		}
		return gotoPage;
	}
}
