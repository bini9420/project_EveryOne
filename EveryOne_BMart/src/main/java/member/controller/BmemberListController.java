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

import member.model.BusinessBean;
import member.model.MemberDao;
import utility.MemberListPaging;

@Controller
public class BmemberListController {
	private final String command = "bMemberList.mb";
	private final String getPage = "bMemberList";

	@Autowired
	MemberDao memberDao;

	// main에서 회원 목록보기 눌렀을때 회원 목록보기
	@RequestMapping(command)
	public String mlist(

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

		List<BusinessBean> bmemberLists = memberDao.getBMemList(map, pageInfo);
		model.addAttribute("bmemLists", bmemberLists);
		model.addAttribute("pageInfo", pageInfo);



		return getPage;



	}
}
