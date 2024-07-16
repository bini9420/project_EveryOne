package document.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import document.model.ReviewcheckDao;
import model.MemberBean;
import document.model.ReviewcheckBean;
 
@Controller
public class RcheckTempSaveController {
	private final String command = "rcheckTempSave.dc";
	private final String gotoPage = "redirect:/rcheckList.dc";
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String tempSave(ReviewcheckBean reviewcheck, HttpSession session) {
		/*
		 * System.out.println("writer: " + reviewcheck.getWriter()); //null
		 * System.out.println("writeday: " + reviewcheck.getWriteday()); //null
		 * System.out.println("re_writer: " + reviewcheck.getRe_writer());
		 * System.out.println("re_writeday: " + reviewcheck.getRe_writeday());
		 * System.out.println("pnum: " + reviewcheck.getPrdnum());
		 * System.out.println("title: " + reviewcheck.getTitle());
		 * System.out.println("content: " + reviewcheck.getContent());
		 */
		
		//rnum(문서번호) 설정
		String maxNum = reviewcheckDao.whatRnumber(); 
		System.out.println("maxNum: " + maxNum);
		String num = (String.valueOf(Integer.parseInt(maxNum)+1));
		String dnum = "";
		dnum += "E-" + num;
		reviewcheck.setRnum(dnum);
		
		//writer 설정
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		reviewcheck.setWriter(mb.getId());
		
		reviewcheckDao.tempSaveRCheck(reviewcheck);
		
		
		
		return gotoPage;
	}
}
