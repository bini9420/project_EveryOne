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
	public String cartInsert(@RequestParam("index") String index, @RequestParam("id") String id, 
							@RequestParam("pnum") int pnum, @RequestParam("qty") int qty, 
							@RequestParam(value="category", required=false) String category,
							@RequestParam(value="range", required=false) String range,
							@RequestParam(value="keyword", required=false) String keyword,
							@RequestParam(value="pageNumber", required=false) String pageNumber,
							Model model, HttpServletResponse response, HttpSession session) throws IOException{
		
		System.out.println("id: "+id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//아이디가 없으면 => 로그인을 안 했다는 뜻
		if(id == "") {
			out.println("<script>");
			out.println("alert('상품을 담으려면 로그인을 해야 합니다.'); location.href='login.mb'");
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
					
					if(index.equals("main")) {
						out.println("alert('상품 담기 성공!!'); location.href='main.mall'");
						
					}else if(index.equals("detail")) {
						out.println("alert('상품 담기 성공!!'); location.href='detail.mall?pnum="+pnum+"'");
						
					}else if(index.equals("interest")) {
						out.println("alert('상품 담기 성공!!'); location.href='interest.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("watch")) {
						out.println("alert('상품 담기 성공!!'); location.href='watch.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("best")) {
						out.println("alert('상품 담기 성공!!'); location.href='bestLists.mall?range="+range+"'");
						
					}else if(index.equals("category")) {
						out.println("alert('상품 담기 성공!!'); location.href='plists.mall?category="+category+"&range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("search")) {
						out.println("alert('상품 담기 성공!!'); location.href='plists.mall?keyword="+keyword+"&range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("recently")) {
						out.println("alert('상품 담기 성공!!'); location.href='plists.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("ad")) {
						out.println("alert('상품 담기 성공!!'); location.href='adProductList.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}
					
					out.println("</script>");
					out.flush();
				}
				
			}else { //겹치는 상품이 없으면 insert
				int cnt2 = mallDao.insertCart(map);
				if(cnt2 > 0){ //장바구니 담기 성공
					out.println("<script>");
					
					if(index.equals("main")) {
						out.println("alert('상품 담기 성공!!'); location.href='main.mall'");
						
					}else if(index.equals("detail")) {
						out.println("alert('상품 담기 성공!!'); location.href='detail.mall?pnum="+pnum+"'");
						
					}else if(index.equals("interest")) {
						out.println("alert('상품 담기 성공!!'); location.href='interest.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("watch")) {
						out.println("alert('상품 담기 성공!!'); location.href='watch.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("best")) {
						out.println("alert('상품 담기 성공!!'); location.href='bestLists.mall?range="+range+"'");
						
					}else if(index.equals("category")) {
						out.println("alert('상품 담기 성공!!'); location.href='plists.mall?category="+category+"&range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("search")) {
						out.println("alert('상품 담기 성공!!'); location.href='plists.mall?keyword="+keyword+"&range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("recently")) {
						out.println("alert('상품 담기 성공!!'); location.href='plists.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}else if(index.equals("ad")) {
						out.println("alert('상품 담기 성공!!'); location.href='adProductList.mall?range="+range+"&pageNumber="+pageNumber+"'");
						
					}
					
					out.println("</script>");
					out.flush();
					
				}else{ // 장바구니 담기 실패
						out.println("<script>");
						
						if(index.equals("main")) {
							out.println("alert('상품 담기 실패...'); location.href='main.mall'");
							
						}else if(index.equals("detail")) {
							out.println("alert('상품 담기 실패...'); location.href='detail.mall?pnum="+pnum+"'");
							
						}else if(index.equals("interest")) {
							out.println("alert('상품 담기 실패...'); location.href='interest.mall?range="+range+"&pageNumber="+pageNumber+"'");
							
						}else if(index.equals("watch")) {
							out.println("alert('상품 담기 실패...'); location.href='watch.mall?range="+range+"&pageNumber="+pageNumber+"'");
							
						}else if(index.equals("best")) {
							out.println("alert('상품 담기 실패...'); location.href='bestLists.mall'");
							
						}else if(index.equals("category")) {
							out.println("alert('상품 담기 실패...'); location.href='plists.mall?category="+category+"&range="+range+"&pageNumber="+pageNumber+"'");
							
						}else if(index.equals("search")) {
							out.println("alert('상품 담기 실패...'); location.href='plists.mall?keyword="+keyword+"&range="+range+"&pageNumber="+pageNumber+"'");
							
						}else if(index.equals("recently")) {
							out.println("alert('상품 담기 실패...'); location.href='plists.mall?range="+range+"&pageNumber="+pageNumber+"'");
							
						}else if(index.equals("ad")) {
							out.println("alert('상품 담기 실패...'); location.href='adProductList.mall?range="+range+"&pageNumber="+pageNumber+"'");
							
						}
						
						out.println("</script>");
						out.flush();
				}
			}
			
			//장바구니 상품 개수 조회
			int cartTotalCount = mallDao.getCartTotalCount(id);
			session.setAttribute("cartTotalCount", cartTotalCount);
		}
		return null;
	}
	
}
