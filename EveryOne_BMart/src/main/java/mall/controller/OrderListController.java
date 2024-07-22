package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;

@Controller
public class OrderListController {
	
	@Autowired
	MallDao mdao;
	
	private final String command = "/orderList.mall";
	private final String getPage = "mall_orderList";
	
	@RequestMapping(command)
	public ModelAndView orderList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		model.MemberBean mb = (model.MemberBean)session.getAttribute("loginInfo");
		String id = mb.getId();
		
		List<model.OrdersBean> olist = mdao.getOrderList(id);
		List<model.ProductBean> plist = new ArrayList<model.ProductBean>();
		int pnum = 0;
		model.ProductBean pb = new model.ProductBean();
		for(model.OrdersBean orderbean : olist ) {
			pnum = orderbean.getPnum();
			pb = mdao.getProductInfo(pnum);
			plist.add(pb);
		}
		
		mav.addObject("olist", olist);
		mav.addObject("plist", plist);
		mav.setViewName(getPage);
		
		return mav;
	}

}