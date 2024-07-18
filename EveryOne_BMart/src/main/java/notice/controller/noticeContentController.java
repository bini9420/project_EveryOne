package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.NoticeBean;
import notice.model.NoticeDao;

@Controller
public class noticeContentController {
	
	@Autowired
	NoticeDao noticeDao;
	
	private final String command = "content.nt";
	private final String goPage = "noticeContent";
	
	@RequestMapping(command)
	public String content(@RequestParam(value = "nnum", required = true) int nnum,
							@RequestParam("pageNumber") int pageNumber,
							@RequestParam(value="whatColumn",required=false) String whatColumn,
							@RequestParam(value="keyword",required=false) String keyword,
							Model model) {
		
		int readcount = noticeDao.getReadCount(nnum);
		noticeDao.updateReadCount(nnum);
		
		NoticeBean nb = noticeDao.viewContent(nnum);
		model.addAttribute("notice", nb);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
		
		return goPage;
	}
}
