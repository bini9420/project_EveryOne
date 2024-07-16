package document.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import document.model.ReviewcheckDao;
import model.MemberBean;
import model.ReviewcheckBean;

@Controller
public class RchckInsertController {

	private final String command = "document_rcheckInsert.dc";
	private final String getPage = "reviewCheckForm";
	private final String gotoPage = "redirect:/rcheckList.dc";
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//GET: o_top.jsp���� ������� �ۼ� Ŭ����
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String review() {
		System.out.println("rcheck Form");
		return getPage;
	}
	 
	
	//POST: document_reviewCheckForm.jsp���� �ۼ� Ŭ����
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String review(ReviewcheckBean reviewcheck, HttpSession session) {
		/*
		 * System.out.println("writer: " + reviewcheck.getWriter()); //null
		 * System.out.println("writeday: " + reviewcheck.getWriteday()); //null
		 * System.out.println("re_writer: " + reviewcheck.getRe_writer());
		 * System.out.println("re_writeday: " + reviewcheck.getRe_writeday());
		 * System.out.println("pnum: " + reviewcheck.getPrdnum());
		 * System.out.println("title: " + reviewcheck.getTitle());
		 * System.out.println("content: " + reviewcheck.getContent());
		 */
		
		//rnum(������ȣ) ����
		String maxNum = reviewcheckDao.whatRnumber(); 
		System.out.println("maxNum: " + maxNum);
		String num = (String.valueOf(Integer.parseInt(maxNum)+1));
		String dnum = "";
		dnum += "E-" + num;
		reviewcheck.setRnum(dnum);
		
		//writer ����
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		reviewcheck.setWriter(mb.getId());
		
		reviewcheckDao.insertReviewCheck(reviewcheck);
		
		return gotoPage;
	}
}