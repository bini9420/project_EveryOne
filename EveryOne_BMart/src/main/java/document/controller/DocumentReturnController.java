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
import document.model.DocumentDao;
import model.MemberBean;
import utility.Paging;

@Controller
public class DocumentReturnController {
	
	private final String command = "document_return.dc";
	private final String getPage = "document_returnBox";
	
	@Autowired
	DocumentDao documentDao;
	
	@RequestMapping(command)
	public String returnBox(@RequestParam(value="whatColumn", required=false) String whatColumn,
   					 	    @RequestParam(value="keyword", required=false) String keyword,
					 	    @RequestParam(value="pageNumber", required=false) String pageNumber,
					 	    HttpServletRequest request,
					 	    HttpSession session,
					 	    Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyowrd", "%" + keyword + "%");
		map.put("id", mb.getId());
		
		int totalCount = documentDao.getReturnCount(map);
		String url = request.getContextPath() + this.command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		model.addAttribute("pageInfo", pageInfo);
		
		List<DocumentBean> lists = documentDao.getAllReturnDocument(map, pageInfo);
		model.addAttribute("lists", lists);
		
		return getPage;
	}
	
}
