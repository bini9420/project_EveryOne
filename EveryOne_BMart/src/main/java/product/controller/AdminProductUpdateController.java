package product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
public class AdminProductUpdateController {
	private final String command = "adminProductUpdate.prd";
	private final String getPage = "adminPrdUpdateForm";
	private final String gotoPage = "redirect:/adminProductList.prd";
	

	@Autowired
	private ProductDao productDao;

	@Autowired
	ServletContext servletContext;

	// productList.jsp에서 수정클릭
	@RequestMapping(value = "adminProductUpdateForm.prd", method = RequestMethod.GET)
	public String updateForm(	
			@RequestParam(value="pnum", required = true) int pnum,
			@RequestParam(value="pageNumber", required = true) int pageNumber,
			@RequestParam(value="keyword", required = false) String keyword,
			HttpSession session,Model model) {
	
			System.out.println(this.getClass()+" GET");
			System.out.println("pnum:"+pnum);
			System.out.println("pageNumber:"+pageNumber);
			System.out.println("keyword:"+keyword);
			ProductBean pb = productDao.detailViewByNum(pnum); 

			model.addAttribute("product" , pb);
			model.addAttribute("pageNumber" , pageNumber);
			return getPage;
		
	}

	@RequestMapping(value=command , method=RequestMethod.POST)
	public ModelAndView update(
			@ModelAttribute("product") @Valid ProductBean product, BindingResult result,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("keyword") String keyword
			) {

		ModelAndView mav = new ModelAndView();

		if(result.hasErrors()) {
			mav.setViewName(getPage);
			if(product.getPimage().equals("")) {
				product.setPimage(product.getUpload2());
			}
			return mav;
		}
		int cnt = -1;

		cnt = productDao.updateProduct(product);



		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/uploadImage");

		if(cnt != -1) {

			String deletePath = servletContext.getRealPath("/resources/uploadImage");
			File file = new File(deletePath+File.separator+product.getUpload2());

			System.out.println("File : " + file);

			if(file.exists()) {
				file.delete();
			}

			mav.setViewName(gotoPage);
			File destination = new File(uploadPath + File.separator + multi.getOriginalFilename());
			try {
				//올리는 작업
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

		mav.addObject("pageNumber", pageNumber);
		mav.addObject("keyword", keyword);

		return mav;
	}
}