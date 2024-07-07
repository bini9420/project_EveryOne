package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.InterestBean;
import mall.model.MallDao;
import mall.model.ProductBean;
import member.model.MemberBean;


@Controller
public class InterestListController {

	private final String command = "/interest.mall";
	private final String getPage = "interestLists";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String interestList(HttpSession session, HttpServletResponse response, Model model) throws IOException {
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//로그인을 안 했을 때
		if(session.getAttribute("loginInfo") == null) {
			out.println("<script>");
			out.println("alert('찜한 상품을 보려면 로그인을 해야 합니다.'); location.href='bmartLogin.mb'");
			out.println("</script>");
			out.flush();
			return null;
		}else {
			
			MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
			
			List<InterestBean> lists = mallDao.getInterestLists(mb.getId());
			
			ArrayList<ProductBean> interest = new ArrayList<ProductBean>();
			for(InterestBean ib : lists) {
				ProductBean product = mallDao.getProductInfo(ib.getPnum());
				interest.add(product);
				model.addAttribute("interest", interest);
			}
			
			return getPage;
		}
	}
}
