package document.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;
import utility.Paging;

@Controller
public class DocumentTempController {

	private final String command = "document_temp.dc";
	private final String getPage = "document_tempBox";
	
	@Autowired
	DocumentDao documentDao;
	
	@RequestMapping(command)
	public String temp(@RequestParam(value="whatColumn", required=false) String whatColumn,
					   @RequestParam(value="keyword", required=false) String keyword,
					   @RequestParam(value="pageNumber", required=false) String pageNumber,
					   HttpServletRequest request,
					   Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyowrd", "%" + keyword + "%");
		
		int totalCount = documentDao.getTempCount(map);
		String url = request.getContextPath() + this.command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		model.addAttribute("pageInfo", pageInfo);
		
		List<DocumentBean> lists = documentDao.getAllTempDocument(map, pageInfo);
		model.addAttribute("lists", lists);
	
		return getPage;
	}
}
