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
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.EnterDao;
import utility.Paging;

@Controller
public class AdminEnterBoxController {
	private final String command = "admin_enterBox.dc";
	private final String getPage = "admin_enterBox";
	
	@Autowired
	EnterDao enterDao;
	
	@RequestMapping(command)
	public String enter(@RequestParam(value="whatColumn", required=false) String whatColumn,
						@RequestParam(value="keyword", required=false) String keyword,
					    @RequestParam(value="pageNumber", required=false) String pageNumber,
					    HttpServletRequest request,
					    HttpSession session,
					    Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		
		int totalCount = enterDao.getEnterTotalCountForAdmin(map);
		String url = request.getRequestURI() + this.command; 
		 
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		model.addAttribute("pageInfo", pageInfo); 
		
		List<DocumentBean> lists= enterDao.getAllEnterDocumentForAdmin(map, pageInfo);
		model.addAttribute("lists", lists);

		return getPage;
	}
	
}
