package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;
import utility.MemberListPaging;


@Controller
public class MemberListController {
	private final String command = "aMemberList.mb";
	private final String getPage = "aMemberList";
	
	@Autowired
	MemberDao memberDao;
	
	// main에서 회원 목록보기 눌렀을때 회원 목록보기
	@RequestMapping(command)
	public String list(
			
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request,
			Model model) {
		System.out.println("keyword"+keyword);
		Map<String, String> map = new HashMap<String, String>();
		
		if (keyword != null && !keyword.trim().isEmpty()) {
			map.put("keyword", "%" + keyword + "%");
		} else {
			map.put("keyword", null);
		}

		int totalCount = memberDao.getTotalCount(map); 
		String url = request.getContextPath() + "/"+this.command;

		MemberListPaging pageInfo = new MemberListPaging(pageNumber, null, totalCount, url,  keyword);

		List<MemberBean> memberLists = memberDao.getMemberList(map, pageInfo);
		model.addAttribute("memberLists", memberLists);
		model.addAttribute("pageInfo", pageInfo);
		
		
		
		return getPage;
	
		
		
	}
}