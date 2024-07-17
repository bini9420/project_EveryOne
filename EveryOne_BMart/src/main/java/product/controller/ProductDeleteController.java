package product.controller;


import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import product.model.ProductDao;

@Controller
public class ProductDeleteController {
	private final String command = "/productDelete.prd";
	private final String gotoPage = "redirect:/productList.prd";

	@Autowired
	ProductDao productDao;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(command)
	public String delete(

			@RequestParam(value="pnum",required=false) Integer pnum,
			@RequestParam(value="chkArr[]",required=false) List<Integer> delnum,
			@RequestParam(value="pageNumber",required=false) Integer pageNumber,
			@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			RedirectAttributes redirectAttributes) {

		System.out.println("delnum"+delnum);


		if(pnum!=null) {

			productDao.deleteProduct(pnum);
		}






		if (delnum != null && !delnum.isEmpty()) {
			for (Integer delno : delnum) {

				System.out.println("delno"+delno);
				productDao.deleteProduct(delno);

			}

		} 




		redirectAttributes.addAttribute("pageNumber", pageNumber);
		redirectAttributes.addAttribute("whatColumn", whatColumn);
		redirectAttributes.addAttribute("keyword", keyword);


		return gotoPage;
	}
}		


