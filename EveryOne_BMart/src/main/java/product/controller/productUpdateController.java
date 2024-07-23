package product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
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

import model.MemberBean;
import model.ProductBean;
import product.model.ProductDao;

@Controller
public class productUpdateController {
	
	private final String command = "owner_prdUpdate.prd";
	private final String gotoPage = "ownerPrdManage";
	private final String getPage = "redirect:/productList_owner.prd";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String update(@RequestParam(value="pnum", required = true) int pnum,
						Model model, HttpSession session) {
		ProductBean pb = productDao.getProductById(pnum);
		model.addAttribute("product",pb);
		
		//해당 아이디로 결재된 상품 카테고리만 보이도록 설정
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		List<ProductBean> lists = productDao.getPcategoryListByWriter(mb.getId());
		model.addAttribute("lists", lists);
 
		return gotoPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView updateForm(@ModelAttribute("product") @Valid ProductBean product,
									BindingResult result,
									HttpServletResponse response,
									Model model,
									@RequestParam(value="whatColumn", required=false) String whatColumn,
									@RequestParam(value="inputPname", required=false) String inputPname,
									@RequestParam(value="inputPnum", required=false) String inputPnum,
									@RequestParam(value="inputDay1", required=false) String inputDay1,
									@RequestParam(value="inputDay2", required=false) String inputDay2,
									@RequestParam(value="pageNumber", required=false) String pageNumber) {

		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(gotoPage);
			if(product.getPimage().equals("")) {
				product.setPimage(product.getUpload2());
			}
			return mav;
		}
		response.setContentType("text/html; charset=UTF-8");
		int cnt = productDao.updateOwnerProduct(product);

		MultipartFile multi = product.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/uploadImage/");
		
		if(cnt > 0) {
			model.addAttribute("whatColumn", whatColumn);
			model.addAttribute("inputPname", inputPname);
			model.addAttribute("inputPnum", inputPnum);
			model.addAttribute("inputDay1", inputDay1);
			model.addAttribute("inputDay2", inputDay2);
			model.addAttribute("pageNumber", pageNumber);
			
			String deletePath = servletContext.getRealPath("/resources/uploadImage/");
			File file = new File(deletePath+File.separator+product.getUpload2());
			
			if(file.exists()) {
				file.delete();
			}
			
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
		} 
		
			mav.setViewName(getPage);
			return mav;
	}
	
}
