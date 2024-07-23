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

import mall.model.MallDao;
import model.InterestBean;
import model.ProductBean;

@Controller
public class UpdateInterestController {

	private final String command = "/updateInterest.mall";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String updateInterest(@RequestParam("page") String page, @RequestParam("index") String index, 
								@RequestParam("id") String id, @RequestParam("pnum") int pnum, 
								@RequestParam(value="category",required=false) String category, 
								@RequestParam(value="range",required=false) String range, 
								@RequestParam(value="keyword",required=false) String keyword, 
								@RequestParam(value="pageNumber",required=false) String pageNumber, 
								HttpServletResponse response, HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//로그인을 안 했다면
		if(id == "") {
			out.println("<script>");
			out.println("alert('상품을 찜하려면 로그인을 해야 합니다.'); location.href='login.mb'");
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
			List<ProductBean> interestLists = mallDao.getInterestLists(id);
			System.out.println("interestLists: "+interestLists.size());
			session.setAttribute("interestLists", interestLists);
			
			//controller로 넘어온 위치에 따라 돌아갈 곳이 달라짐
			if(page.equals("category")) {
				String ca = URLEncoder.encode(category, "UTF-8");
				return "redirect:/plists.mall?category="+ca+"&range="+range+"&pageNumber="+pageNumber;
				
			}else if(page.equals("keyword")) {
				String key = URLEncoder.encode(keyword, "UTF-8");
				return "redirect:/plists.mall?keyword="+key+"&range="+range+"&pageNumber="+pageNumber;
				
			}else if(page.equals("new")) {
				return "redirect:/plists.mall?range="+range+"&pageNumber="+pageNumber;
				
			}else if(page.equals("best")) {
				return "redirect:/bestLists.mall";
				
			}else if(page.equals("detail")) {
				return "redirect:/detail.mall?pnum="+pnum;
				
			}else if(page.equals("interest")) {
				return "redirect:/interest.mall?range="+range+"&pageNumber="+pageNumber;
				
			}else if(page.equals("watch")) {
				return "redirect:/watch.mall?range="+range+"&pageNumber="+pageNumber;
				
			}else if(page.equals("ad")) {
				return "redirect:/adProductList.mall?range="+range+"&pageNumber="+pageNumber;
				
			}else {
				return "redirect:/main.mall";
			}
			
		}
	}
}