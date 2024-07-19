package notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.DescriptionBean;
import model.MemberBean;
import notice.model.DescriptionDao;
import utility.Paging;

@Controller
public class descriptionListController {
	
	@Autowired
	DescriptionDao desDao;
	
	private final String command = "/dlist.nt";
	private final String gotoPage = "descriptionList";
	private final String getPage = "AdescriptionList";
	@RequestMapping(command)
	public String dlist(@RequestParam(value="whatColumn", required=false) String whatColumn,
						@RequestParam(value="keyword", required=false) String keyword,
						@RequestParam(value="pageNumber", required=false) String pageNumber,
						HttpServletRequest request,
						HttpSession session,
						Model model) {
		
		if(session.getAttribute("loginInfo") == null) { // 
			session.setAttribute("destination", "redirect:/dlist.nt");
			return "redirect:/login.mb";
		}else {
		
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
        String id = loginInfo.getId();
        
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");

		int totalCount = desDao.getDesCount(map);
		String url = request.getContextPath() + this.command;

		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		
		List<DescriptionBean> db = desDao.getDes(map,pageInfo);
		model.addAttribute("db", db);
		model.addAttribute("pageInfo", pageInfo);
		
		 if (id != null && "admin".equals(id)) {
             return getPage;
         }
		 return gotoPage;
		}
	}
}
					
