package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import mall.model.PayInfo;
import model.AddressBean;
import model.MemberBean;
import model.OrdersBean;
import model.ReviewBean;

@Controller
public class PayController {
	
	private final String command = "/pay.mall";
	private final String getPage = "mall_orderList";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value = command)
	@ResponseBody
	public ModelAndView pay(@RequestBody PayInfo payInfo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("pay컨트롤러: "+payInfo.getId());
		System.out.println("pay컨트롤러: "+payInfo.getPayment());
		System.out.println("pay컨트롤러: "+payInfo.getStatus());
		System.out.println("pay 컨트롤러: " + payInfo);
		
		model.OrdersBean ob = new model.OrdersBean();
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
		String id = mb.getId();
		
		int[] pnumber = payInfo.getPnum();
		int[] pamount = payInfo.getQty();
		double[] orderprice = payInfo.getOrderprice();
		List<model.OrdersBean> olist = new ArrayList<model.OrdersBean>();
		int cnt = -1; // 장바구니 삭제 성공/실패 확인
		int mcnt = -1; // 재고수량 차감 성공/실패 확인
		for(int i=0;i<pnumber.length;i++) {
			
			int pnum = pnumber[i];
			int Pamount = pamount[i];
			
			//주문한 상품 장바구니에서 삭제
			cnt = mallDao.deleteCart(pnum);
			System.out.println("주문상품 장바구니 삭제 cnt: " + cnt);
			
			// 상품 재고수량 차감
			int stock = mallDao.getStockByPnum(pnum);
			System.out.println("paycontroller 기존 상품 재고수량: "+stock);
			
			int minusStock = stock - Pamount;
			mcnt = mallDao.minusStock(pnum, minusStock);
			
			if(mcnt>0) {
				System.out.println("재고수량 차감 완료");
			}
			// 상품 재고수량 차감
			
			ob.setId(payInfo.getId());
			ob.setPnum(pnum);
			ob.setPamount(pamount[i]);
			ob.setPrice((int) orderprice[i]);
			ob.setContents(payInfo.getContents());
			ob.setWay(payInfo.getWay());
			ob.setStatus(0);
			ob.setPayment(payInfo.getPayment());
			cnt = mallDao.insertOrder(ob);
			olist.add(ob);
		}
		mav.addObject("olist", olist);
		return mav;
	}

}

