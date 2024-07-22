package mall.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import mall.model.PaynDelieveryInfo;
import model.MemberBean;
import model.OrdersBean;
import model.ProductBean;

@Controller
public class PayInfoController {
	
	@Autowired
	MallDao mdao;
	
	private final String command = "/paypage.mall";
	private final String getPage = "mall_payPage";
	private final String getPage2 = "mall_payPage2";
	private final String gotoPage = "";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView paymentPage(@RequestParam("pnum") int[] pnum,
			@RequestParam("message") String message,
			@RequestParam("way") String way,
			@RequestParam("payment") String payment,
			@RequestParam("qty") int[] qty,
			@RequestParam("mid") String mid,
			@RequestParam("mname") String mname,
			HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(message);
		System.out.println(way);
		System.out.println(payment);
		System.out.println(qty);
		System.out.println(mname);
		int totalAmount = 0;
		
		MemberBean mb = new MemberBean();
		mb = (MemberBean)session.getAttribute("loginInfo");
		String id = mb.getId();
		System.out.println("id: "+id);
		mb = mdao.getBmartMember(mb.getId());
		String payname= "B마트";
		
		List<OrdersBean> olist = new ArrayList<OrdersBean>();
		List<Integer> pnumList = new ArrayList<Integer>();
		List<Integer> orderPriceList = new ArrayList<Integer>();
		List<Integer> qtyList = new ArrayList<Integer>();
		for(int i = 0; i < pnum.length; i++) {
			int num = pnum[i];
            int quantity = qty[i];
            System.out.println("quantity:"+quantity);
            qtyList.add(quantity);
            
            OrdersBean ob = new OrdersBean();
			System.out.println(mb.getId());
			ProductBean pb = mdao.getProductInfo(num);
			ob.setId(mb.getId());
			ob.setPnum(pb.getPnum());
			ob.setPamount(quantity);
			int orderPrice = quantity*pb.getPrice();
			System.out.println(orderPrice);
			orderPriceList.add(orderPrice);
			ob.setPrice(orderPrice);
			ob.setContents(message);
			ob.setWay(way);
			ob.setStatus(0);
			ob.setPayment(payment);
			totalAmount += orderPrice;	
			olist.add(ob);
            if (pb.getId()=="admin") {
                payname = "배민상회";
            }
            pnumList.add(num);
		}
		System.out.println("payname: "+payname);
		mav.addObject("pnumList", pnumList); // 
		mav.addObject("orderPriceList", orderPriceList); // 
		mav.addObject("qtyList", qtyList); // 
		mav.addObject("way", way); // 
		mav.addObject("message", message); // 
		mav.addObject("payment", payment); // 
		mav.addObject("payname", payname); // 결제페이지 구매물품명: B마트
		mav.addObject("mb", mb); // 결제페이지에 띄울 회원이름, 회원아이디, 회원이메일
		mav.addObject("totalAmount", totalAmount); // 결제페이지에 띄울 결제총액
		// 주문테이블에 삽입 할 정보들
		mav.addObject("olist", olist); // 결제페이지 구매물품명: B마트
		
		mav.setViewName(getPage);
		
		return mav;
	}
}

