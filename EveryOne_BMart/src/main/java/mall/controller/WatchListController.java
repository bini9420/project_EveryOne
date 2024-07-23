package mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;
import model.MemberBean;
import model.ProductBean;
import model.SearchBean;
import utility.MallPaging;

@Controller
public class WatchListController {

	private final String command = "/watch.mall";
	private final String getPage = "watchList";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String interestList(HttpSession session, HttpServletResponse response,
								@RequestParam(value="range", required=false) String range, 
								@RequestParam(value="pageNumber", required=false) String pageNumber, 
								Model model, HttpServletRequest request) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		SearchBean sb = new SearchBean();
		sb.setId(mb.getId());
		sb.setRange(range);
		
		int totalCount = mallDao.getWatchCount(sb);
		String url = request.getContextPath()+this.command;
		
		MallPaging pageInfo = new MallPaging(pageNumber, null, totalCount, url, null, range, null);
		
		List<ProductBean> wlists = mallDao.getWatch(sb, pageInfo);
		System.out.println("wlists size: "+wlists.size());
		 
		model.addAttribute("wlists", wlists);
		model.addAttribute("pageInfo", pageInfo); 
		return getPage;
	}
}