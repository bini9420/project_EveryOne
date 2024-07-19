package review.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import product.model.ProductBean;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class reviewInsertController {
	
	@Autowired
	ReviewDao reviewDao;
	
	private final String command = "/insertForm.rv";
	private final String gotoPage = "reviewForm";
	private final String gotoPage2 = "redirect:/orderList.mall";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView insertForm(@RequestParam("onum") int onum,
									@RequestParam("pnum") int pnum,
									@RequestParam("id") String id,
									@RequestParam("pname") String pname
									) {
		
		
		System.out.println(onum);
		System.out.println(pnum);
		System.out.println(id);
		
		ModelAndView mav = new ModelAndView();
		
		ReviewBean rb = new ReviewBean();
		
		mav.addObject("onum",onum);
		mav.addObject("pnum",pnum);
		mav.addObject("id",id);
		mav.addObject("pname",pname);
		
		mav.setViewName(gotoPage);
		
		return mav;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView insertReview(@RequestParam("onum") int onum,
								@RequestParam("pnum") int pnum,
								@RequestParam("id") String id,
								@RequestParam("starRating") int starRating,
								@RequestParam("contents") String contents,
								HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		ProductBean pb = reviewDao.getProductInfo(pnum);
		String image = pb.getPimage(); 
		
		ReviewBean rb = new ReviewBean();
		rb.setId(id);
		rb.setOnum(onum);
		rb.setPnum(pnum);
		rb.setRcomment(contents);
		rb.setScore(starRating);
		
		System.out.println("id"+id);
		System.out.println("img"+image);
		System.out.println("onum"+rb.getOnum());
		System.out.println("pnum"+pnum);
		System.out.println("contents"+contents);
		System.out.println("stars"+starRating);
		
		int cnt = reviewDao.insertReview(rb);
		System.out.println(cnt);
		if(cnt>0) {
			String successScript = "<script>alert('리뷰가 성공적으로 등록되었습니다.');</script>";
	        response.setContentType("text/html; charset=UTF-8");
	        try {
				response.getWriter().print(successScript);
			} catch (IOException e) {
				e.printStackTrace();
			}
	        mav.setViewName(gotoPage2);
		}else {
			String failScript = "<script>alert('리뷰 등록 실패');</script>";
	        response.setContentType("text/html; charset=UTF-8");
	        try {
				response.getWriter().print(failScript);
			} catch (IOException e) {
				e.printStackTrace();
			}
	        mav.setViewName(gotoPage);
		}
		
		return mav;
	}
}
	

