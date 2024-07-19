package product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import model.ProductBean;
import product.model.ProductDao;

@Controller
public class OwnerProductUpdateController {
	private final String command = "productUpdate_owner.prd";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public void update(ProductBean product, HttpServletResponse response) throws IOException {
		System.out.println("여기요");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("price: " + product.getPrice());
		System.out.println("pcontent: " + product.getPcontent());
		System.out.println("stock: " + product.getStock());
		
		int cnt = -1;
		cnt = productDao.updateProductByOwner(product); 
		
		if(cnt != -1) {
			String updatePath = servletContext.getRealPath("/resources/uploadImage");

			File file = new File(updatePath + "\\" + product.getUpload2());
			file.delete();
			
			MultipartFile multi = product.getUpload();
			File destination = new File(updatePath + "\\" + multi.getOriginalFilename());
			try {
				multi.transferTo(destination);
				
				out.println("<script>");
				out.println("alert('수정 및 저장이 완료되었습니다'); location.href='productList_owner.prd'");
				out.println("</script>");
				out.flush();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
