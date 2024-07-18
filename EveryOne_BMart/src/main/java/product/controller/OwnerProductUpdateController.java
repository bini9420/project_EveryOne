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
		System.out.println("�����");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("price: " + product.getPrice());
		System.out.println("pcontent: " + product.getPcontent());
		System.out.println("stock: " + product.getStock());
		
		//��ǰ�̹���(pimage) ����
		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/product"); //image�� ���ε��ϴ� ��
		
		int cnt = -1;
		cnt = productDao.updateProductByOwner(product); 
		if(cnt != -1) { //���� ����
			File destination = new File(uploadPath + "\\" + multi.getOriginalFilename()); // => ����غ��� ���ڿ��� �������� ������ file�� ������
			
			out.println("<script>");
			out.println("alert('���� �� ������ �Ϸ�Ǿ����ϴ�'); location.href='redirect:/productList_owner.prd");
			out.println("</script>");
			out.flush();
			try {
				multi.transferTo(destination); //������ ������ ������ ��ο��ٰ� ���ε��ϴ� ��
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
