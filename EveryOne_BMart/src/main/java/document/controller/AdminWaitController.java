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
import utility.PagingPlus;

@Controller
public class AdminWaitController {
	private final String command = "/admin_waitBox.dc";
	private final String getPage = "admin_waitBox";
	
	@Autowired
	DocumentDao documentDao;
	
	//GET: a_top.jsp에서 문서수신함 클릭시
	@RequestMapping(command)
	public String receive(@RequestParam(value="whatColumn", required=false) String whatColumn,
						  @RequestParam(value="inputDnum", required=false) String inputDnum,
						  @RequestParam(value="inputTitle", required=false) String inputTitle,
						  @RequestParam(value="inputDay1", required=false) String inputDay1,
						  @RequestParam(value="inputDay2", required=false) String inputDay2,
						  @RequestParam(value="pageNumber", required=false) String pageNumber,
						  HttpServletRequest request,
						  HttpSession session,
						  Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("inputDnum", "%" + (inputDnum != null ? inputDnum : "") + "%");
	    map.put("inputTitle", "%" + (inputTitle != null ? inputTitle : "") + "%");
		map.put("inputDay1", inputDay1);
		map.put("inputDay2", inputDay2);
		
		int totalCount = documentDao.getWaitTotalCountForAdmin(map);
		String url = request.getContextPath() + this.command;
		
		PagingPlus pageplus = new PagingPlus(pageNumber, null, totalCount, url, whatColumn, inputDnum, inputTitle, inputDay1, inputDay2);
		model.addAttribute("pageplus", pageplus);
		
		List<DocumentBean> lists= documentDao.getAllWaitDocumentForAdmin(map, pageplus);
		model.addAttribute("lists", lists);
		
		return getPage;	
	}
	
}
