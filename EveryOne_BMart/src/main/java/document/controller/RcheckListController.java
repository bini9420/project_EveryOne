package document.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.ReviewcheckBean;
import document.model.ReviewcheckDao;
import member.model.MemberBean;
import utility.Paging;

@Controller
public class RcheckListController {
	private final String command = "rcheckList.dc";
	private final String getPage = "reviewCheckList";

	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//GET: o_top.jsp 에서 리뷰검토함 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String reviewcheck(@RequestParam(value="whatColumn", required=false) String whatColumn,
							  @RequestParam(value="keyword", required=false) String keyword,
							  @RequestParam(value="pageNumber", required=false) String pageNumber,
							  HttpServletRequest request,
							  HttpSession session,
							  Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		map.put("id", mb.getId());
		
		int totalCount = reviewcheckDao.getRTotalCount(map);
		String url = request.getContextPath() + this.command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		model.addAttribute("pageInfo", pageInfo);
		
		List<ReviewcheckBean> lists = reviewcheckDao.getAllReviewCheck(map, pageInfo);
		model.addAttribute("lists", lists);
		System.out.println("rcheck size: " + lists.size());
		
		return getPage;
	}
	
}
