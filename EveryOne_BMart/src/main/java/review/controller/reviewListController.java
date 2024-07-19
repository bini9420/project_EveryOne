package review.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.ReviewBean;

import review.model.ReviewDao;

@Controller
public class reviewListController {
	
	@Autowired
	ReviewDao reviewDao;
	
	private final String command = "list.rv";	
	private final String getPage = "reviewPrdList";
	
	
	@RequestMapping(command)
	public String list(@RequestParam(value="pnum",required=false) int pnum,
						Model model) {
		
		
		List<ReviewBean> reviews = reviewDao.getReviewsByProduct(pnum);
		double avgScore = reviewDao.getAverageScore(pnum);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("pnum", pnum);
		
		// ���䰡 ���� ��� �޽��� �߰�
        if (reviews.isEmpty()) {
            model.addAttribute("noReviewsMessage", "��ϵ� ���䰡 �����ϴ�.");
        }
        
		return getPage;
	}
	
}
