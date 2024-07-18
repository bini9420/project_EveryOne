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
import org.springframework.web.bind.annotation.RequestParam;
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
	public void update(@RequestParam("pnum") String pnum, ProductBean product, HttpServletResponse response) throws IOException {
		System.out.println("여기요");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("price: " + product.getPrice());
		System.out.println("pcontent: " + product.getPcontent());
		System.out.println("stock: " + product.getStock());
		
		//상품이미지(pimage) 설정
		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/product"); //image를 업로드하는 곳
		
		int cnt = -1;
		cnt = productDao.updateProductByOwner(product); 
		if(cnt != -1) { //삽입 성공
			File destination = new File(uploadPath + "\\" + multi.getOriginalFilename()); // => 출력해보면 문자열로 나오지만 실제로 file로 생성됨
			
			out.println("<script>");
			out.println("alert('수정 및 저장이 완료되었습니다'); location.href='redirect:/productList_owner.prd");
			out.println("</script>");
			out.flush();
			try {
				multi.transferTo(destination); //생성된 파일을 실제로 경로에다가 업로드하는 것
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
