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
public class CommonMemListController {
	private final String command = "cMemberList.mb";
	private final String getPage = "cMemberList";
	
	@Autowired
	MemberDao memberDao;

	@RequestMapping(command)
	public String list(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request,
			Model model) {
		System.out.println("cmemberListController");
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");

		int totalCount = memberDao.getTotalCount(map); 
		String url = request.getContextPath() + this.command;

		MemberListPaging pageInfo = new MemberListPaging(pageNumber, null, totalCount, url, keyword);

		List<MemberBean> commonMLists = memberDao.commonMember(map, pageInfo);		
		model.addAttribute("commonMLists",commonMLists);
		model.addAttribute("pageInfo", pageInfo);
		
		return getPage;
	
		
		
	}

}
