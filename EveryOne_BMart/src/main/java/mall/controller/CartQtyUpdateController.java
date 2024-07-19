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
		System.out.println("cartUpdateId점검: "+id);
		
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
            System.out.println("상품 번호: " + pnum + ", 주문 수량: " + pqty);
            
            cnt = mallDao.updateCartQty(paramMap);
            
            ProductBean pb = mallDao.getProductInfo(Integer.parseInt(pnum));
            plist.add(pb);
        }
            if(cnt>0) {
            	mav.addObject("qty", qty);
            	mav.addObject("plist", plist);
            	System.out.println("업데이트 성공");
            	mav.setViewName(getPage);
            }else {
            	System.out.println("업데이트 실패");
            	PrintWriter out;
				try {
					out = response.getWriter();
					out.println("<script>");
					out.println("alert('주문 수량 변경 실패')");
					out.println("history.back()");
					out.println("</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
            }
            // 예시: pnum과 pqty를 이용한 DB 업데이트 등의 로직을 수행할 수 있습니다.
		return mav;
	}
	
	

}
