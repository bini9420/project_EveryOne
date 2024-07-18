package review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class reviewAllListController {
	
	@Autowired
	ReviewDao reviewDao;
	
	private final String command = "allrvlist.rv";
	private final String gotoPage = "AllReviewList";
	
	@RequestMapping(command)
	public String listAllReviews(Model model) {
		List<ReviewBean> reviews = reviewDao.getAllReviews();
		model.addAttribute("reviews", reviews);
		
		// ���䰡 ���� ��� �޽��� �߰�
        if (reviews.isEmpty()) {
            model.addAttribute("noReviewsMessage", "��ϵ� ���䰡 �����ϴ�.");
        }
        
		return gotoPage;
	}
}
