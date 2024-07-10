package document.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import document.model.ReviewcheckBean;
import document.model.ReviewcheckDao;
import member.model.MemberBean;

@Controller
public class DocumentRchckInsertController {

	private final String command = "document_rcheckInsert.dc";
	private final String getPage = "document_reviewCheckForm";
	private final String gotoPage = "redirect:/document_box.dc";
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//GET: o_top.jsp에서 리뷰검토 작성 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String review() {
		return getPage;
	}
	
	
	//POST: document_reviewCheckForm.jsp에서 작성 클릭시
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String review(ReviewcheckBean reviewcheck, HttpSession session) {
		System.out.println("writer: " + reviewcheck.getWriter()); //null
		System.out.println("writeday: " + reviewcheck.getWriteday()); //null
		System.out.println("re_writer: " + reviewcheck.getRe_writer());
		System.out.println("re_writeday: " + reviewcheck.getRe_writeday());
		System.out.println("pnum: " + reviewcheck.getPrdnum());
		System.out.println("title: " + reviewcheck.getTitle());
		System.out.println("content: " + reviewcheck.getContent());
		
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
		
		reviewcheckDao.insertReviewCheck(reviewcheck);
		
		return gotoPage;
	}
}
