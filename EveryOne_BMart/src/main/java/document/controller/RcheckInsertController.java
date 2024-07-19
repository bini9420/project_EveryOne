package document.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.ReviewcheckDao;
import model.MemberBean;
import model.ReviewBean;

@Controller
public class RcheckInsertController {
	private final String command = "rcheckInsert.dc";
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	@RequestMapping(command)
	public void insert(@RequestParam("rnum") String rnum, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//���⿡�� rnum�� review ���̺��� ������ȣ
		ReviewBean review = reviewcheckDao.getReview(rnum);
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		//��ǰ��ȣ(prdnum), �ۼ���(writer), �����ۼ���(re_writer), �����ۼ���(re_writeday), ����(content) ����
		Map<String, String> map = new HashMap<String, String>();
		map.put("prdnum", String.valueOf(review.getPnum()));
		map.put("writer", mb.getId());
		map.put("re_writer", review.getId());
		map.put("re_writeday", String.valueOf(review.getRdate()));
		map.put("content", review.getRcomment());
		
		//review_check ���̺� - ������ȣ(rnum) ����
		String maxNum = reviewcheckDao.whatRcheckNumber();  
		String num = (String.valueOf(Integer.parseInt(maxNum)+1));
		String rno = "";
		rno += "E-" + num;
		map.put("rnum", rno);
		
		reviewcheckDao.insertRcheck(map);
		
		out.println("<script>");
		out.println("alert('���� ���� ��û�� �Ϸ�Ǿ����ϴ�.'); location.href='allrvlist.rv'");
		out.println("</script>");
		out.flush();
		
	}
}
  