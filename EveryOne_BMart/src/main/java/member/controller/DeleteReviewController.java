package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class DeleteReviewController {

	private final String command = "/deleteReview.mb";
	private final String gotoPage = "redirect:/mypage.mb?index=review";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String deleteReview(@RequestParam("rnum") int rnum, @RequestParam("pageNumber") int pageNumber) {
		
		memberDao.deleteReview(rnum);
		return gotoPage+"&pageNumber="+pageNumber;
	}
}
