package mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.CategoryBean;
import mall.model.MallDao;
import mall.model.ProductBean;
import member.model.MemberBean;

@Controller
public class MallMainController {

	private final String command = "/main.mall";
	private final String getPage = "mall_main";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String mall(Model model, HttpSession session) {
		
		List<CategoryBean> categoryLists = mallDao.getAllCategory();
		session.setAttribute("categoryLists", categoryLists);
		
		List<ProductBean> bestProducts = mallDao.getBestProduct();
		//System.out.println("bestProducts: "+bestProducts.size());
		model.addAttribute("bestProducts", bestProducts);
		
		//최근 본 상품이랑 찜한 상품은 로그인 했을 때만 조회 + 장바구니 상품 개수
		if(session.getAttribute("loginInfo") != null) {
			
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			
			//최근 본 상품 조회
			List<ProductBean> watchLists = mallDao.getWatchLists(loginInfo.getId());
			System.out.println("id_watchLists: "+loginInfo.getId()+"_"+watchLists.size());
			model.addAttribute("watchLists", watchLists);
			
			//찜한 상품 조회
			List<ProductBean> interestLists = mallDao.getInterestLists(loginInfo.getId());
			System.out.println("interestLists: "+interestLists.size());
			session.setAttribute("interestLists", interestLists);
			
			//장바구니 상품 개수 조회
			int cartTotalCount = mallDao.getCartTotalCount(loginInfo.getId());
			session.setAttribute("cartTotalCount", cartTotalCount);
		}
		
		return getPage;
	}
}
