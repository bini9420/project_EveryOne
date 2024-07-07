package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.InterestBean;
import mall.model.MallDao;

@Controller
public class UpdateInterestController {

	private final String command = "/updateInterest.mall";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String updateInterest(@RequestParam("page") String page, @RequestParam("index") String index, 
								@RequestParam("id") String id, @RequestParam("pnum") int pnum, 
								@RequestParam(value="category",required=false) String category, @RequestParam(value="range",required=false) String range, 
								@RequestParam(value="keyword",required=false) String keyword, @RequestParam(value="mall",required=false) String mall, 
								HttpServletResponse response, HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//로그인을 안 했다면
		if(id == "") {
			out.println("<script>");
			out.println("alert('상품을 찜하려면 로그인을 해야 합니다.'); location.href='bmartLogin.mb'");
			out.println("</script>");
			out.flush();
			return null;
			
		}else {
			InterestBean ib = new InterestBean();
			ib.setId(id);
			ib.setPnum(pnum);
			
			if(index.equals("del")) {
				//찜 목록에서 삭제
				mallDao.deleteInterest(ib);
				
			}else {
				//찜 목록에 추가
				mallDao.insertInterest(ib);
			}
			
			//찜한 상품 조회
			List<InterestBean> ilists = mallDao.getInterestLists(id);
			session.setAttribute("ilists", ilists);
			
			if(page.equals("category")) {
				String ca = URLEncoder.encode(category, "UTF-8");
				return "redirect:/plists.mall?category="+ca+"&range="+range+"&mall="+mall;
				
			}else if(page.equals("keyword")) {
				String key = URLEncoder.encode(keyword, "UTF-8");
				return "redirect:/plists.mall?keyword="+key+"&range="+range+"&mall="+mall;
				
			}else if(page.equals("new")) {
				return "redirect:/plists.mall?range="+range+"&mall="+mall;
				
			}else if(page.equals("best")) {
				return "redirect:/bestLists.mall";
				
			}else if(page.equals("detail")) {
				return "redirect:/detail.mall?pnum="+pnum;
				
			}else {
				return "redirect:/main.mall";
			}
			
		}
	}
}
