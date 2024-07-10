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
		
		//�ֱ� �� ��ǰ�̶� ���� ��ǰ�� �α��� ���� ���� ��ȸ + ��ٱ��� ��ǰ ����
		if(session.getAttribute("loginInfo") != null) {
			
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			
			//�ֱ� �� ��ǰ ��ȸ
			List<ProductBean> watchLists = mallDao.getWatchLists(loginInfo.getId());
			System.out.println("id_watchLists: "+loginInfo.getId()+"_"+watchLists.size());
			model.addAttribute("watchLists", watchLists);
			
			//���� ��ǰ ��ȸ
			List<ProductBean> interestLists = mallDao.getInterestLists(loginInfo.getId());
			System.out.println("interestLists: "+interestLists.size());
			session.setAttribute("interestLists", interestLists);
			
			//��ٱ��� ��ǰ ���� ��ȸ
			int cartTotalCount = mallDao.getCartTotalCount(loginInfo.getId());
			session.setAttribute("cartTotalCount", cartTotalCount);
		}
		
		return getPage;
	}
}
