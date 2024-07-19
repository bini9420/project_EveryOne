package mall.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import mall.model.PayInfo;
import orders.model.OrdersBean;
import orders.model.OrdersDao;

@Controller
public class PayController {
	
	private final String command = "/pay.mall";
	private final String getPage = "mall_orderList";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value = command)
	@ResponseBody
	public ModelAndView pay(@RequestBody PayInfo payInfo
			) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("pay��Ʈ�ѷ�: "+payInfo.getId());
		System.out.println("pay��Ʈ�ѷ�: "+payInfo.getPayment());
		System.out.println("pay��Ʈ�ѷ�: "+payInfo.getStatus());
		System.out.println("pay ��Ʈ�ѷ�: " + payInfo);
		
		OrdersBean ob = new OrdersBean();
		
		int[] pnumber = payInfo.getPnum();
		int[] pamount = payInfo.getQty();
		double[] orderprice = payInfo.getOrderprice();
		List<OrdersBean> olist = new ArrayList<OrdersBean>();
		int cnt = -1; // ��ٱ��� ���� ����/���� Ȯ��
		int mcnt = -1; // ������� ���� ����/���� Ȯ��
		for(int i=0;i<pnumber.length;i++) {
			
			int pnum = pnumber[i];
			int Pamount = pamount[i];
			
			//�ֹ��� ��ǰ ��ٱ��Ͽ��� ����
			cnt = mallDao.deleteCart(pnum);
			System.out.println("�ֹ���ǰ ��ٱ��� ���� cnt: " + cnt);
			
			// ��ǰ ������� ����
			int stock = mallDao.getStockByPnum(pnum);
			System.out.println("paycontroller ���� ��ǰ �������: "+stock);
			
			int minusStock = stock - Pamount;
			mcnt = mallDao.minusStock(pnum, minusStock);
			
			if(mcnt>0) {
				System.out.println("������� ���� �Ϸ�");
			}
			// ��ǰ ������� ����
			
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
