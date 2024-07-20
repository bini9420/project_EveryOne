package product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
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

import model.ProductBean;
import product.model.ProductDao;

@Controller
public class productUpdateController {
	
	private final String command = "owner_prdUpdate.prd";
	private final String gotoPage = "ownerPrdManage";
	private final String getPage = "redirect:/ownerPrdList";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String update(@RequestParam(value="pnum", required = true) int pnum,
						Model model) {
		ProductBean pb = productDao.getProductById(pnum);
		
		model.addAttribute("product",pb);

		return gotoPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView updateForm(@ModelAttribute("product") @Valid ProductBean product,
									BindingResult result,
									HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(gotoPage);
			return mav;
		}
		response.setContentType("text/html; charset=UTF-8");
		int cnt = productDao.updateOwnerProduct(product);

		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/product/");
		
		if(cnt > 0) {
			File destination = new File(uploadPath+File.separator+multi.getOriginalFilename());
			try {
				multi.transferTo(destination);
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('상품수정이 완료되었습니다'); location.href='productList_owner.prd'");
				out.println("</script>");
				out.flush();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			mav.setViewName(getPage);
			return mav;
		}
		return null;
	}
	
}
