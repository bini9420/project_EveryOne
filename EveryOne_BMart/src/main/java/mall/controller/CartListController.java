package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import model.CartBean;
import model.MemberBean;
import model.ProductBean;

@Controller
public class CartListController {

	private final String command = "/cart.mall";
	private final String getPage = "mall_cart";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public ModelAndView cart(HttpSession session, HttpServletResponse response) throws IOException {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		ModelAndView mav = new ModelAndView();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(loginInfo == null) {
			out.println("<script>");
			out.println("alert('장바구니 내역은 회원만 조회할 수 있습니다.'); location.href='login.mb'");
			out.println("</script>");
			out.flush();
			return null;
		}else {
		
			//장바구니 상품 개수 조회
			int cartTotalCount = mallDao.getCartTotalCount(loginInfo.getId());
			session.setAttribute("cartTotalCount", cartTotalCount);
			
			String id = loginInfo.getId();
			System.out.println("cat_controller id: "+id);
			
			List<CartBean> clist =  mallDao.getCartById(id);
			int clistCnt = clist.size();
			List<ProductBean> plist = new ArrayList<ProductBean>();
			List<Integer> clistQty = new ArrayList<Integer>();
			
			System.out.println();
			for(int i=0;i<clistCnt;i++) {
				int pnum = clist.get(i).getPnum();
				int qtylist = clist.get(i).getQty();
				System.out.println("cartlistcont pnum: " + pnum);
				ProductBean pb = mallDao.getProductInfo(pnum);
				System.out.println(pb.getPname()); 
				clistQty.add(qtylist);
				plist.add(pb);
			}
			
			mav.addObject("qty", clistQty);
			mav.addObject("plist", plist);
			mav.setViewName(getPage);
			
			return mav;
		}
	}
}