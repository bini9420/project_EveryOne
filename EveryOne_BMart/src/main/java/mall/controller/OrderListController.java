package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import model.MemberBean;
import model.ProductBean;
import orders.model.OrdersBean;

@Controller
public class OrderListController {
	
	@Autowired
	MallDao mdao;
	
	private final String command = "/orderList.mall";
	private final String getPage = "mall_orderList";
	
	@RequestMapping(command)
	public ModelAndView orderList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		String id = mb.getId();
		
		List<OrdersBean> olist = mdao.getOrderList(id);
		List<ProductBean> plist = new ArrayList<ProductBean>();
		int pnum = 0;
		ProductBean pb = new ProductBean();
		for(OrdersBean orderbean : olist ) {
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
