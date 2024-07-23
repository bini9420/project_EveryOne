package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import model.AddressBean;
import model.CartBean;
import model.ProductBean;

@Controller
public class OrderController {
	
	private final String command = "/order.mall";
	private final String getPage = "mall_order";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView order(@RequestParam("rowSelect") String[] pnumber,
							  @RequestParam("dFee2") String dFee2,
							  HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		model.MemberBean mb = (model.MemberBean)session.getAttribute("loginInfo");
		String id = mb.getId();
		model.MemberBean member = mallDao.getBmartMember(id);
		List<AddressBean> alists =  mallDao.getAddressList(id);
		
		int dFee = Integer.parseInt(dFee2);
		
		System.out.println("member id test: "+member.getPhone1());
		System.out.println("member id: "+id);
		System.out.println("dFee2: " +dFee);
		System.out.println("Ordercontroller member값 받는지 테스트: "+member.getPassword());
		
		List<ProductBean> plist = new ArrayList<ProductBean>();
		List<CartBean> clist =  mallDao.getCartById(id);
		List<Integer> clistQty = new ArrayList<Integer>();
		
        for (int i = 0; i < pnumber.length; i++) {
            String pnum = pnumber[i];
            System.out.println("상품 번호: " + pnum );
            ProductBean pb = mallDao.getProductInfo(Integer.parseInt(pnum));
            plist.add(pb);
            
            int qty = mallDao.getQtyByPnum(pnum, id);
            System.out.println("상품 qty: " + qty);
            clistQty.add(qty);
        }
        
        mav.addObject("dFee", dFee);
        mav.addObject("member", member);
        mav.addObject("alists", alists);
		mav.addObject("qty", clistQty);
		mav.addObject("plist", plist);
		mav.addObject("id", id);
		mav.setViewName(getPage);
		
		return mav;
	}

}
