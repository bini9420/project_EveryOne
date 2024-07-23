package review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.MemberBean;
import model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class reviewAllListController {
	
	@Autowired
	ReviewDao reviewDao;
	
	private final String command = "allrvlist.rv";
	private final String gotoPage = "AllReviewList";
	
	@RequestMapping(command)
	public String listAllReviews(@RequestParam(value="rnum", required=false) String rnum, Model model, HttpSession session) {
		MemberBean mb =	(MemberBean)session.getAttribute("loginInfo");
		List<ReviewBean> reviews = reviewDao.getAllReviews(mb.getId());
		model.addAttribute("reviews", reviews);
		
		// ���䰡 ���� ��� �޽��� �߰�
        if (reviews.isEmpty()) {
            model.addAttribute("noReviewsMessage", "��ϵ� ���䰡 �����ϴ�.");
        }
        
		return gotoPage;
	}
}
