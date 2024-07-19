package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;
import model.CartBean;
import model.ProductBean;

@Controller
public class CartQtyUpdateController {
	
	private final String command = "/updateQty.mall";
	private final String getPage = "redirect:/cart.mall";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView update(@RequestParam("pnum") String[] pnumArray,
			@RequestParam("pqty") String[] pqtyArray, HttpSession session, HttpServletResponse response
			) {
		ModelAndView mav = new ModelAndView();
		
		model.MemberBean mb = (model.MemberBean)session.getAttribute("loginInfo");
		String id = mb.getId();
		System.out.println("cartUpdateId����: "+id);
		
		List<CartBean> clist =  mallDao.getCartById(id);
		int clistCnt = clist.size();
		List<Integer> qty = new ArrayList<Integer>();
		
		for(int i=0;i<clistCnt;i++) {
			int qtylist = clist.get(i).getQty();
			qty.add(qtylist);
		}
		
		List<ProductBean> plist = new ArrayList<ProductBean>();
		Map<String, String> paramMap = new HashMap<String, String>();
		int cnt = -1;
        for (int i = 0; i < pnumArray.length; i++) {
            String pnum = pnumArray[i];
            String pqty = pqtyArray[i];
            
            paramMap.put("pnum", pnum);
            paramMap.put("pqty", pqty);
            System.out.println("��ǰ ��ȣ: " + pnum + ", �ֹ� ����: " + pqty);
            
            cnt = mallDao.updateCartQty(paramMap);
            
            ProductBean pb = mallDao.getProductInfo(Integer.parseInt(pnum));
            plist.add(pb);
        }
            if(cnt>0) {
            	mav.addObject("qty", qty);
            	mav.addObject("plist", plist);
            	System.out.println("������Ʈ ����");
            	mav.setViewName(getPage);
            }else {
            	System.out.println("������Ʈ ����");
            	PrintWriter out;
				try {
					out = response.getWriter();
					out.println("<script>");
					out.println("alert('�ֹ� ���� ���� ����')");
					out.println("history.back()");
					out.println("</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
            }
            // ����: pnum�� pqty�� �̿��� DB ������Ʈ ���� ������ ������ �� �ֽ��ϴ�.
		return mav;
	}
	
	

}
