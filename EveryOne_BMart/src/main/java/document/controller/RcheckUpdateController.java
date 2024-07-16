package document.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.ReviewcheckDao;
import model.MemberBean;
import document.model.ReviewcheckBean;
  
@Controller
public class RcheckUpdateController {
	private final String command = "rcheckUpdate.dc";
	private final String getPage = "rcheckUpdateForm";
	private final String gotoPage = "";
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//GET: document_rcheckDetailView.jsp에서 작성 버튼 클릭시 
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String rcheckUpdate(@RequestParam("rnum") String rnum, Model model, HttpSession session) {
		ReviewcheckBean document = reviewcheckDao.getRcheckByRnum(rnum);
		model.addAttribute("document", document);
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		model.addAttribute("loginInfo", mb);
		
		return getPage;
	}
}
