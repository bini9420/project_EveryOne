package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;

@Controller
public class CartInsertController {

	private final String command = "/insertCart.mall";
	
	@Autowired
	MallDao mallDao;
	
	//main page에서 상품을 담을 때
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String cartInsert(@RequestParam("id") String id, @RequestParam("pnum") int pnum, @RequestParam("qty") int qty, 
								Model model, HttpServletResponse response) throws IOException{
		System.out.println("id: "+id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//아이디가 없으면 => 로그인을 안 했다는 뜻
		if(id == "") {
			out.println("<script>");
			out.println("alert('상품을 담으려면 로그인을 해야 합니다.'); location.href='bmartLogin.mb'");
			out.println("</script>");
			out.flush();
			
		}else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pnum", String.valueOf(pnum));
			map.put("qty", String.valueOf(qty));
		
			//장바구니 내역에 같은 상품이 존재하는지 확인
			int cart = mallDao.getCart(map);
			
			if(cart > 0) {//겹치는 상품이 있으면 주문수량+1
				int cnt = mallDao.updateCart(map);
				if(cnt > 0){ //장바구니 담기 성공
					out.println("<script>");
					out.println("alert('상품 담기 성공!!'); location.href='main.mall'");
					out.println("</script>");
					out.flush();
				}
				
			}else { //겹치는 상품이 없으면 insert
				int cnt2 = mallDao.insertCart(map);
				if(cnt2 > 0){ //장바구니 담기 성공
					out.println("<script>");
					out.println("alert('상품 담기 성공!!'); location.href='main.mall'");
					out.println("</script>");
					out.flush();
					
				}else{ // 장바구니 담기 실패
						out.println("<script>");
						out.println("alert('상품 담기 실패...'); location.href='main.mall'");
						out.println("</script>");
						out.flush();
				}
			}
		}
		return null;
	}
	
	
	//상세페이지에서 상품을 담을 때
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String cartInsert2(@RequestParam("id") String id, @RequestParam("pnum") int pnum, @RequestParam("qty") int qty, 
								Model model, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("id: "+id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//아이디가 없으면 => 로그인을 안 했다는 뜻
		if(id == "") {
			out.println("<script>");
			out.println("alert('상품을 담으려면 로그인을 해야 합니다.'); location.href='bmartLogin.mb'");
			out.println("</script>");
			out.flush();
			
		}else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pnum", String.valueOf(pnum));
			map.put("qty", String.valueOf(qty));
		
			//장바구니 내역에 같은 상품이 존재하는지 확인
			int cart = mallDao.getCart(map);
			
			
			if(cart > 0) {//겹치는 상품이 있으면 주문수량+1
				int cnt = mallDao.updateCart(map);
				//장바구니 상품 개수 조회
				int cartTotalCount = mallDao.getCartTotalCount(id);
				session.setAttribute("cartTotalCount", cartTotalCount);
				
				if(cnt > 0){ //장바구니 담기 성공
					out.println("<script>");
					out.println("alert('상품 담기 성공!!'); location.href='detail.mall?pnum="+pnum+"'");
					out.println("</script>");
					out.flush();
				}
				
			}else { //겹치는 상품이 없으면 insert
				int cnt2 = mallDao.insertCart(map);
				//장바구니 상품 개수 조회
				int cartTotalCount = mallDao.getCartTotalCount(id);
				session.setAttribute("cartTotalCount", cartTotalCount);

				if(cnt2 > 0){ //장바구니 담기 성공
					out.println("<script>");
					out.println("alert('상품 담기 성공!!'); location.href='detail.mall?pnum="+pnum+"'");
					out.println("</script>");
					out.flush();
					
				}else{ // 장바구니 담기 실패
						out.println("<script>");
						out.println("alert('상품 담기 실패...'); location.href='detail.mall?pnum="+pnum+"'");
						out.println("</script>");
						out.flush();
				}
			}
		}
		return null;
	}
}
