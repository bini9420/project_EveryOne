package product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBDao;

@Controller
public class productDeleteController {
	
	private final String command = "delete.prd";
	private final String gotoPage = "redirect:/list.prd";
	
	@Autowired
	ProductBDao productDao;
	
	@RequestMapping(command)
	public ModelAndView delete(@RequestParam(value="pnum") int pnum,
								@RequestParam(value="pageNumber", required=false) String pageNumber,
								HttpServletResponse response) {
		
		int cnt = productDao.deleteProduct(pnum);
		ModelAndView mav = new ModelAndView();
		
		if(cnt == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert(); history.go(-1);</script>");
				out.flush();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
