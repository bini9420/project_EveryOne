package document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.ReviewcheckDao;
import model.ReviewcheckBean;

@Controller
public class RcheckDetailController {

	private final String command = "rcheckDetail.dc";
	private final String getPage = "rcheckDetailView";
	private final String gotoPage = "";
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//document_reviewCheckList.jsp에서 테이블에서 row 클릭시(문서 상세보기)
	@RequestMapping(command)
	public String rcheckDetail(@RequestParam("rnum") String rnum, Model model) {
		//System.out.println("rnum: " + rnum);
		ReviewcheckBean rcheck = reviewcheckDao.getRcheckByRnum(rnum);
		model.addAttribute("rcheck", rcheck);
		
		return getPage;
	}
}
