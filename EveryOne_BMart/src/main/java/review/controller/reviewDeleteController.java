package review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import review.model.ReviewDao;

@Controller
public class reviewDeleteController {
	
	@Autowired
	ReviewDao reviewDao;
	
	private final String command = "delete.rv";
	private final String gotoPage = "redirect:/list.rv";
	
	@RequestMapping(command)
	public String delete(@RequestParam("rnum") int rnum,
						@RequestParam("pnum") int pnum
						) {
		
		int cnt = reviewDao.deleteReview(rnum);

		return gotoPage + "?pnum=" + pnum;
	}
	
}
