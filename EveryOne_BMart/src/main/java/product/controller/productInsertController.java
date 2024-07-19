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

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class productInsertController {
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;

	private final String command = "insert.prd";
	private final String gotoPage = "prdInsert";
	private final String getPage = "redirect:/list.prd";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insert(HttpSession session) {
		
		 if(session.getAttribute("loginInfo") == null) {
			 session.setAttribute("destination", "redirect:/insert.prd");
			 return "redirect:/login.mb"; 
			 }
		 else { 
			 return gotoPage; 
			 }
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView insertForm(@ModelAttribute("product") @Valid ProductBean pb,
								BindingResult result) {

		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.setViewName(gotoPage);
			return mav;
		}

		MultipartFile multi = pb.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/uploadImage/");
		
		//int cnt = -1;
		int cnt = productDao.insertProduct(pb);
		if(cnt != -1) {
			mav.setViewName(getPage);
			
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
