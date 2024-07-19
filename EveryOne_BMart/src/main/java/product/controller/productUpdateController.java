package product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.ProductBBean;
import product.model.ProductBDao;
import product.model.ProductBean;
import product.model.ProductDao;
	

@Controller
public class productUpdateController {
	
	private final String command = "/update.prd";
	private final String gotoPage = "prdUpdate";
	private final String getPage = "redirect:/list.prd";
	
	@Autowired
	ProductBDao productDao;
	
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String update(@RequestParam(value="pnum", required = true) int pnum,
						@RequestParam(value="pageNumber", required = false) int pageNumber,
						Model model) {
		ProductBBean pb = productDao.getProductById(pnum);
		
		model.addAttribute("product",pb);
		model.addAttribute("pageNumber" , pageNumber);

		return gotoPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView updateForm(@ModelAttribute("product") @Valid ProductBBean product,
									BindingResult result,
									@RequestParam("pageNumber") int pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(gotoPage);
			return mav;
		}
		
		int cnt = productDao.updateProduct(product);

		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/images/");
		
		if(cnt != -1) {
			
			String deletePath = servletContext.getRealPath("/resources/images/");
			File file = new File(deletePath+File.separator+product.getUpload2());
			
			System.out.println("File : " + file);
			
			if(file.exists()) {
				file.delete();
			}
			
			mav.setViewName(gotoPage);
			File destination = new File(uploadPath + File.separator + multi.getOriginalFilename());
			try {
				
				multi.transferTo(destination);
			}catch (IllegalStateException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else {
			mav.setViewName(getPage);
		}
		mav.setViewName(getPage);
		mav.addObject("pageNumber", pageNumber);
		
		return mav; 
	}
	
}
