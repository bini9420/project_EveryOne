package product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductDao;

@Controller
public class OwnerProductDeleteController {

	private final String command = "productDelete_owner.prd";

	@Autowired
	ProductDao productDao;
	
	@RequestMapping(command)
	public void delete(@RequestParam("pnum") String pnum, HttpServletResponse response) throws IOException {
		System.out.println("pnum: " + pnum);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		productDao.deleteProductByOwner(pnum);
		
		out.println("<script>");
		out.println("alert('해당 상품이 삭제가 완료되었습니다'); location.href='productList_owner.prd'");
		out.println("</script>");
		out.flush();
	}
}
