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
import utility.PagingPlus;

@Controller
public class AdminAllBoxController {
	private final String command = "admin_allBox.dc";
	private final String getPage = "admin_allBox";
	
	@Autowired
	DocumentDao documentDao;
	
	@RequestMapping(command)
	public String allBox(@RequestParam(value="whatColumn", required=false) String whatColumn,
				 	     @RequestParam(value="inputDnum", required=false) String inputDnum,
				 	     @RequestParam(value="inputTitle", required=false) String inputTitle,
				  	     @RequestParam(value="inputDay1", required=false) String inputDay1,
				 	     @RequestParam(value="inputDay2", required=false) String inputDay2,
				 	     @RequestParam(value="pageNumber", required=false) String pageNumber,
				 	     HttpServletRequest request,
				 	  	 Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("inputDnum", "%" + (inputDnum != null ? inputDnum : "") + "%");
	    map.put("inputTitle", "%" + (inputTitle != null ? inputTitle : "") + "%");
		map.put("inputDay1", inputDay1);
		map.put("inputDay2", inputDay2);
		
		int totalCount = documentDao.getTotalCountForAdmin(map);
		String url = request.getRequestURI() + this.command;
		
		PagingPlus pageplus = new PagingPlus(pageNumber, null, totalCount, url, whatColumn, inputDnum, inputTitle, inputDay1, inputDay2);
		model.addAttribute("pageplus", pageplus);
		
		//전체 문서
		List<DocumentBean> lists = documentDao.getAllDocumentForAdmin(map, pageplus); 
		model.addAttribute("lists", lists);
		
		return getPage;
	}
}
