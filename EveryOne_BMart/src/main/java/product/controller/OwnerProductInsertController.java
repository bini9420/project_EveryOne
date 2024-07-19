package product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import document.model.DocumentBean;
import model.MemberBean;
import model.ProductBean;
import product.model.ProductDao;

@Controller
public class OwnerProductInsertController {
	private final String command = "productInsert_owner.prd";
	private final String getPage = "ownerPrdInsertForm";

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ProductDao productDao;
	
	//GET: o_top.jsp���� ��ǰ���� > ��ǰ��� Ŭ����
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insert(HttpSession session, HttpServletResponse response, Model model) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//��ǰ��� ���ε� ����� getPage�� �̵�
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		int count = productDao.checkProductApproval(mb.getId()); 
		if(count <= 0) {
			out.println("<script>");
			out.println("alert('��ǰ��� ���� ������ �ʿ��մϴ�'); location.href='omain.mb'");
			out.println("</script>");
			out.flush();
		} 
		
		List<ProductBean> lists = productDao.getPcategoryListByWriter(mb.getId());
		model.addAttribute("lists", lists);
		return getPage;
	}
	
	//POST: ownerPrdInsertForm.jsp���� ��� ��ư Ŭ����
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String insert(ProductBean product, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/product/");
		
		int cnt = -1;
		cnt = productDao.insertProductByOwner(product);
		
		if(cnt > 0) {
			File destination = new File(uploadPath+File.separator+multi.getOriginalFilename());
			try {
				multi.transferTo(destination);
				
				out.println("<script>");
				out.println("alert('��ǰ����� �Ϸ�Ǿ����ϴ�'); location.href='productList_owner.prd'");
				out.println("</script>");
				out.flush();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			return getPage;
		}
		return null;
	}
}
