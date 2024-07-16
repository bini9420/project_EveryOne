package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.MallDao;
import model.MemberBean;

@Controller
public class CartListController {

	private final String command = "/cart.mall";
	private final String getPage = "mall_cart";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String cart(HttpSession session, HttpServletResponse response) throws IOException {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(loginInfo == null) {
			out.println("<script>");
			out.println("alert('��ٱ��� ������ ȸ���� ��ȸ�� �� �ֽ��ϴ�.'); location.href='login.mb'");
			out.println("</script>");
			out.flush();
			return null;
		}else {
		
			//��ٱ��� ��ǰ ���� ��ȸ
			int cartTotalCount = mallDao.getCartTotalCount(loginInfo.getId());
			session.setAttribute("cartTotalCount", cartTotalCount);
			
			return getPage;
		}
	}
}
