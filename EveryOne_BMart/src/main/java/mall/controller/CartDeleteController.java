package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;

@Controller
public class CartDeleteController {
	
	private final String command = "/cartDelete.mall";
	private final String getPage = "redirect:/cart.mall";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public ModelAndView delete(@RequestParam("pnum") int pnum, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		PrintWriter out;
		int cnt = -1;
		cnt = mallDao.deleteCart(pnum);
		if(cnt>0) {
			System.out.println("��ٱ��� ��ǰ ���� ����");
			mav.setViewName(getPage);
		}else {
        	System.out.println("��ٱ��� ��ǰ ���� ����");
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('��ٱ��� ���� ����')");
				out.println("history.back()");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			mav.setViewName(getPage);
		}
		return mav;
	}
}
