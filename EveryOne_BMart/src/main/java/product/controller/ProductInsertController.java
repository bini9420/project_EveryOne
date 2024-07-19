package product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.MemberBean;
import model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductInsertController {
	private final String command = "productInsert.prd";
	private final String getPage = "productInsertForm"; 
	private final String gotoPage = "redirect:/productList.prd";

	@Autowired 
	private ProductDao productDao;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insert(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//상품등록 승인된 사람만 getPage로 이동
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		int count = productDao.checkProductApproval(mb.getId()); 
		if(count <= 0) {
			out.println("<script>");
			out.println("alert('상품등록 결재 승인이 필요합니다'); location.href='omain.mb'");
			out.println("</script>");
			out.flush();
		} 
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView insertForm(@ModelAttribute("product") @Valid ProductBean product, BindingResult result) {
		System.out.println("prod.getPcategory():"+product.getPcategory());
		System.out.println("prod.getPrice():"+product.getPrice());
		System.out.println("prod.getId():"+product.getId());
		System.out.println("prod.getPname():"+product.getPname());
		System.out.println("prod.getPcontent():"+product.getPcontent());
		System.out.println("prod.getPrice():"+product.getPrice());
		System.out.println("prod.getPimage():"+product.getPimage()); // null, 시계.jpg
		System.out.println("prod.getUpload():"+product.getUpload());
		
		MultipartFile multi = product.getUpload();
		
		//int mallId = Integer.parseInt(mall);
        //product.setMall(mallId);
		String uploadPath = servletContext.getRealPath("/resources/uploadImage/");
		System.out.println("uploadPath:" + uploadPath);
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			System.out.println("insert error");
			mav.setViewName(getPage);
			return mav; 
		}
		 
		int cnt = -1;
		cnt = productDao.insertProduct(product);
		if(cnt != -1) {
			mav.setViewName(gotoPage);
			
			File destination = new File(uploadPath+File.separator+multi.getOriginalFilename());
		
			try {
				multi.transferTo(destination);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			mav.setViewName(getPage);
		}
		
		return mav;
	}

}