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
		
		//�ֱ� �� ��ǰ�̶� ���� ��ǰ�� �α��� ���� ���� ��ȸ + ��ٱ��� ��ǰ ����
		if(session.getAttribute("loginInfo") != null) {
			
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			
			//�ֱ� �� ��ǰ ��ȸ
			List<WatchBean> watchLists = mallDao.getWatchLists(loginInfo.getId());
			System.out.println("id_watchLists: "+loginInfo.getId()+"_"+watchLists.size());
			
			ArrayList<ProductBean> watchProductLists = new ArrayList<ProductBean>();
			for(int i=0;i<watchLists.size();i++) {
				ProductBean watchProductInfo = mallDao.getProductInfo(watchLists.get(i).getPnum());
				watchProductLists.add(i, watchProductInfo);
				model.addAttribute("watchProductLists", watchProductLists);
			}
			
			//���� ��ǰ ��ȸ
			List<InterestBean> ilists = mallDao.getInterestLists(loginInfo.getId());
			System.out.println("ilists: "+ilists.size());
			session.setAttribute("ilists", ilists);
			
			ArrayList<ProductBean> interestProductLists = new ArrayList<ProductBean>();
			for(int i=0;i<ilists.size();i++) {
				ProductBean interestProductInfo = mallDao.getProductInfo(ilists.get(i).getPnum());
				interestProductLists.add(i, interestProductInfo);
				model.addAttribute("interestProductLists", interestProductLists);
			}
			
			//��ٱ��� ��ǰ ���� ��ȸ
			int cartTotalCount = mallDao.getCartTotalCount(loginInfo.getId());
			session.setAttribute("cartTotalCount", cartTotalCount);
		}
		
		session.setAttribute("mall", 0);
		return getPage;
	}
}
