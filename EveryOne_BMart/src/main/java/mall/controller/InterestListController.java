package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
public class InterestListController {

	private final String command = "/interest.mall";
	private final String getPage = "interestLists";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String interestList(HttpSession session, HttpServletResponse response,
								@RequestParam(value="range", required=false) String range, 
								@RequestParam(value="pageNumber", required=false) String pageNumber, 
								Model model, HttpServletRequest request) throws IOException {
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//로그인을 안 했을 때
		if(session.getAttribute("loginInfo") == null) {
			out.println("<script>");
			out.println("alert('찜한 상품을 보려면 로그인을 해야 합니다.'); location.href='login.mb'");
			out.println("</script>");
			out.flush();
			return null;
		}else {
			
			MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
			
			SearchBean sb = new SearchBean();
			sb.setId(mb.getId());
			sb.setRange(range);
			
			int totalCount = mallDao.getNewProductCount(sb);
			String url = request.getContextPath()+this.command;
			
			MallPaging pageInfo = new MallPaging(pageNumber, null, totalCount, url, null, range, null);
			
			List<ProductBean> ilists = mallDao.getInterest(sb, pageInfo);
			 
			model.addAttribute("ilists", ilists);
			model.addAttribute("pageInfo", pageInfo); 
			return getPage;
		}
	}
}
