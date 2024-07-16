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

import document.model.DocumentBean;
import document.model.DocumentDao;
import document.model.ReviewcheckDao;
import model.MemberBean;
import document.model.ReviewcheckBean;
import utility.Paging;

@Controller
public class DocumentWaitController {

	private final String command = "document_wait.dc";
	private final String getPage = "document_waitBox";
	
	@Autowired
	DocumentDao documentDao;
	
	//GET: document_box.jsp에서 결재대기함 클릭시, o_top.jsp에서 결재대기함 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String waitBox(@RequestParam(value="whatColumn", required=false) String whatColumn,
						  @RequestParam(value="keyword", required=false) String keyword,
						  @RequestParam(value="pageNumber", required=false) String pageNumber,
						  HttpServletRequest request,
						  HttpSession session,
						  Model model) {
		//System.out.println("keyword: " + keyword);
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		map.put("id", mb.getId());
		
		int totalCount = documentDao.getWaitCount(map);
		String url = request.getContextPath() + this.command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		model.addAttribute("pageInfo", pageInfo);
		
		List<DocumentBean> lists = documentDao.getAllWaitDocument(map, pageInfo);
		model.addAttribute("lists", lists);
		
		return getPage;
	}

}
