package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.CategoryBean;
import mall.model.InterestBean;
import mall.model.MallDao;
import mall.model.ProductBean;
import mall.model.WatchBean;
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
		
		List<ProductBean> bMartBestProducts = mallDao.getBestProductByBmart();
		//System.out.println("bestProducts: "+bestProducts.size());
		model.addAttribute("bMartBestProducts", bMartBestProducts);
		
		//최근 본 상품이랑 찜한 상품은 로그인 했을 때만 조회 + 장바구니 상품 개수
		if(session.getAttribute("loginInfo") != null) {
			
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			
			//최근 본 상품 조회
			List<WatchBean> watchLists = mallDao.getWatchLists(loginInfo.getId());
			System.out.println("id_watchLists: "+loginInfo.getId()+"_"+watchLists.size());
			
			ArrayList<ProductBean> watchProductLists = new ArrayList<ProductBean>();
			for(int i=0;i<watchLists.size();i++) {
				ProductBean watchProductInfo = mallDao.getProductInfo(watchLists.get(i).getPnum());
				watchProductLists.add(i, watchProductInfo);
				model.addAttribute("watchProductLists", watchProductLists);
			}
			
			//찜한 상품 조회
			List<InterestBean> ilists = mallDao.getInterestLists(loginInfo.getId());
			System.out.println("ilists: "+ilists.size());
			session.setAttribute("ilists", ilists);
			
			ArrayList<ProductBean> interestProductLists = new ArrayList<ProductBean>();
			for(int i=0;i<ilists.size();i++) {
				ProductBean interestProductInfo = mallDao.getProductInfo(ilists.get(i).getPnum());
				interestProductLists.add(i, interestProductInfo);
				model.addAttribute("interestProductLists", interestProductLists);
			}
			
			//장바구니 상품 개수 조회
			int cartTotalCount = mallDao.getCartTotalCount(loginInfo.getId());
			session.setAttribute("cartTotalCount", cartTotalCount);
		}
		
		session.setAttribute("mall", 0);
		return getPage;
	}
}
