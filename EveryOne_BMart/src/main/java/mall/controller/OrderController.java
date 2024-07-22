package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import model.AddressBean;
import model.CartBean;
import model.MemberBean;
import model.ProductBean;

@Controller
public class OrderController {
	
	private final String command = "/order.mall";
	private final String getPage = "mall_order";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public ModelAndView order(@RequestParam("rowSelect") String[] pnumber, HttpSession session, HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		if(mb.getName() == null || mb.getPhone1() == null || mb.getPhone2() == null) {
			out.append("<script>");
			out.append("alert('���������� �Է����� �ʾƼ� �ֹ��� ��ƽ��ϴ�.<br> �������������� �����ϰ� ������.'); location.href='mypage.mb?index=memberInfoUpdate'");
			out.append("</script>");
			out.flush();
			return null;
		}else {
			List<AddressBean> address = mallDao.getAddressList(mb.getId());
			if(address.size() <= 0) {
				out.append("<script>");
				out.append("alert('������� �Է����� �ʾƼ� �ֹ��� ��ƽ��ϴ�. �������������� ������� ����ϰ������!'); location.href='mypage.mb?index=addressInfo'");
				out.append("</script>");
				out.flush();
				return null;
			}
			String id = mb.getId();
			model.MemberBean member = mallDao.getBmartMember(id);
			List<AddressBean> alists =  mallDao.getAddressList(id);
			
			System.out.println("member id: "+id);
			System.out.println("Ordercontroller member�� �޴��� �׽�Ʈ: "+member.getPassword());
			
			List<ProductBean> plist = new ArrayList<ProductBean>();
			List<CartBean> clist =  mallDao.getCartById(id);
			List<Integer> clistQty = new ArrayList<Integer>();
			
	        for (int i = 0; i < pnumber.length; i++) {
	            String pnum = pnumber[i];
	            System.out.println("��ǰ ��ȣ: " + pnum );
	            ProductBean pb = mallDao.getProductInfo(Integer.parseInt(pnum));
	            plist.add(pb);
	            
	            int qty = mallDao.getQtyByPnum(pnum, id);
	            System.out.println("��ǰ qty: " + qty);
	            clistQty.add(qty);
	        }
	        
	        mav.addObject("member", member);
	        mav.addObject("alists", alists);
			mav.addObject("qty", clistQty);
			mav.addObject("plist", plist);
			mav.addObject("id", id);
			mav.setViewName(getPage);
			
			return mav;
			
		}
	}
	
	

}
