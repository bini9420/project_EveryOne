package notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.NoticeBean;
import notice.model.NoticeDao;
import utility.Paging;

@Controller
public class noticeListController {
	
	public final String command = "/list.nt";
	public final String goPage = "noticeList";
	
	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(command)
	public String list(@RequestParam(value="whatColumn", required=false) String whatColumn,
									@RequestParam(value="keyword", required=false) String keyword,
									@RequestParam(value="pageNumber", required=false) String pageNumber,
									HttpServletRequest request,
									Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		
		int totalCount = noticeDao.getNoticeCount(map);
		System.out.println("totalCount: "+totalCount);
		String url = request.getContextPath() + this.command;
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);

		List<NoticeBean> lists = noticeDao.getNotice(map,pageInfo);
		List<NoticeBean> lists2 = noticeDao.getNoticeY(map);
		model.addAttribute("lists", lists);
		model.addAttribute("lists2", lists2);
		model.addAttribute("pageInfo", pageInfo);
		
		return goPage;
	}
	
}
