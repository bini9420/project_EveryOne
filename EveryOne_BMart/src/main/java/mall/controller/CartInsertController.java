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
	
	//main page���� ��ǰ�� ���� ��
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String cartInsert(@RequestParam("id") String id, @RequestParam("pnum") int pnum, @RequestParam("qty") int qty, 
								Model model, HttpServletResponse response) throws IOException{
		System.out.println("id: "+id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//���̵� ������ => �α����� �� �ߴٴ� ��
		if(id == "") {
			out.println("<script>");
			out.println("alert('��ǰ�� �������� �α����� �ؾ� �մϴ�.'); location.href='bmartLogin.mb'");
			out.println("</script>");
			out.flush();
			
		}else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pnum", String.valueOf(pnum));
			map.put("qty", String.valueOf(qty));
		
			//��ٱ��� ������ ���� ��ǰ�� �����ϴ��� Ȯ��
			int cart = mallDao.getCart(map);
			
			if(cart > 0) {//��ġ�� ��ǰ�� ������ �ֹ�����+1
				int cnt = mallDao.updateCart(map);
				if(cnt > 0){ //��ٱ��� ��� ����
					out.println("<script>");
					out.println("alert('��ǰ ��� ����!!'); location.href='main.mall'");
					out.println("</script>");
					out.flush();
				}
				
			}else { //��ġ�� ��ǰ�� ������ insert
				int cnt2 = mallDao.insertCart(map);
				if(cnt2 > 0){ //��ٱ��� ��� ����
					out.println("<script>");
					out.println("alert('��ǰ ��� ����!!'); location.href='main.mall'");
					out.println("</script>");
					out.flush();
					
				}else{ // ��ٱ��� ��� ����
						out.println("<script>");
						out.println("alert('��ǰ ��� ����...'); location.href='main.mall'");
						out.println("</script>");
						out.flush();
				}
			}
		}
		return null;
	}
	
	
	//������������ ��ǰ�� ���� ��
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String cartInsert2(@RequestParam("id") String id, @RequestParam("pnum") int pnum, @RequestParam("qty") int qty, 
								Model model, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("id: "+id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//���̵� ������ => �α����� �� �ߴٴ� ��
		if(id == "") {
			out.println("<script>");
			out.println("alert('��ǰ�� �������� �α����� �ؾ� �մϴ�.'); location.href='bmartLogin.mb'");
			out.println("</script>");
			out.flush();
			
		}else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pnum", String.valueOf(pnum));
			map.put("qty", String.valueOf(qty));
		
			//��ٱ��� ������ ���� ��ǰ�� �����ϴ��� Ȯ��
			int cart = mallDao.getCart(map);
			
			
			if(cart > 0) {//��ġ�� ��ǰ�� ������ �ֹ�����+1
				int cnt = mallDao.updateCart(map);
				//��ٱ��� ��ǰ ���� ��ȸ
				int cartTotalCount = mallDao.getCartTotalCount(id);
				session.setAttribute("cartTotalCount", cartTotalCount);
				
				if(cnt > 0){ //��ٱ��� ��� ����
					out.println("<script>");
					out.println("alert('��ǰ ��� ����!!'); location.href='detail.mall?pnum="+pnum+"'");
					out.println("</script>");
					out.flush();
				}
				
			}else { //��ġ�� ��ǰ�� ������ insert
				int cnt2 = mallDao.insertCart(map);
				//��ٱ��� ��ǰ ���� ��ȸ
				int cartTotalCount = mallDao.getCartTotalCount(id);
				session.setAttribute("cartTotalCount", cartTotalCount);

				if(cnt2 > 0){ //��ٱ��� ��� ����
					out.println("<script>");
					out.println("alert('��ǰ ��� ����!!'); location.href='detail.mall?pnum="+pnum+"'");
					out.println("</script>");
					out.flush();
					
				}else{ // ��ٱ��� ��� ����
						out.println("<script>");
						out.println("alert('��ǰ ��� ����...'); location.href='detail.mall?pnum="+pnum+"'");
						out.println("</script>");
						out.flush();
				}
			}
		}
		return null;
	}
}
