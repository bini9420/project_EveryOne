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
		model.addAttribute("categoryLists", categoryLists);
		
		List<ProductBean> bestProducts = mallDao.getBestProduct();
		//System.out.println("bestProducts: "+bestProducts.size());
		model.addAttribute("bestProducts", bestProducts);
		
		//�ֱ� �� ��ǰ�̶� ���� ��ǰ�� �α��� ���� ���� ��ȸ
		if(session.getAttribute("loginInfo") != null) {
			
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			
			//�ֱ� �� ��ǰ ��ȸ
			List<WatchBean> watchLists = mallDao.getWatchLists(loginInfo.getId());
			System.out.println("id_watchLists: "+loginInfo.getId()+"_"+watchLists.size());
			
			ArrayList<ProductBean> watchProductLists = new ArrayList<ProductBean>();
			for(int i=0;i<watchLists.size();i++) {
				ProductBean watchProductInfo = mallDao.getWatchProductInfo(watchLists.get(i).getPnum());
				watchProductLists.add(i, watchProductInfo);
				model.addAttribute("watchProductLists", watchProductLists);
			}
			
			//���� ��ǰ ��ȸ
			List<InterestBean> ilists = mallDao.getInterestLists(loginInfo.getId());
			System.out.println("ilists: "+ilists.size());
			
			ArrayList<ProductBean> interestProductLists = new ArrayList<ProductBean>();
			for(int i=0;i<ilists.size();i++) {
				ProductBean interestProductInfo = mallDao.getInterestProductInfo(ilists.get(i).getPnum());
				interestProductLists.add(i, interestProductInfo);
				model.addAttribute("interestProductLists", interestProductLists);
			}
		}
		
		return getPage;
	}
}
