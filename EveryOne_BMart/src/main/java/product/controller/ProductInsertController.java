package product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
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

import mall.model.ProductBean;
import member.model.MemberBean;
import product.model.ProductDao;

@Controller
public class ProductInsertController {
	private final String command = "productInsert.prd";
	private final String getPage = "adminPrdInsertForm"; 
	private final String gotoPage = "redirect:/productList.prd";

	@Autowired 
	private ProductDao productDao;

	@Autowired
	ServletContext servletContext;
	
	// productList.jsp에서 추가하기 클릭
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insert() {
		
		
		return getPage;
	}
	 
	
	//
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView insertForm(@ModelAttribute("product") @Valid ProductBean product, BindingResult result,HttpSession session) {
		         
		System.out.println("prod.getId():"+product.getId());
		System.out.println("prod.getImage():"+product.getPimage()); // null, 시계.jpg
		System.out.println("prod.getUpload():"+product.getUpload());
		MultipartFile multi = product.getUpload();
		
		String uploadPath = servletContext.getRealPath("/resources/uploadImage/");
		System.out.println("uploadPath:" + uploadPath);
		
		MemberBean login = (MemberBean)session.getAttribute("loginInfo");
		product.setId(login.getId());
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
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
		}else {
			mav.setViewName(getPage);
		}
		
		return mav;
	}
}