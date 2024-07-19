package document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;
import document.model.EnterDao;
import document.model.ReviewcheckDao;
import model.EnterBean;
import model.ReviewcheckBean;

@Controller
public class AdminDocumentDetailController {
	
	private final String command ="adminDocument_detail.dc";
	private final String getPage1 = "admin_documentDetail";
	private final String getPage2 = "admin_enterDetail";
	private final String getPage3 = "admin_rcheckDetail";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	EnterDao enterDao;
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//GET: admin_allBox.jsp, admin_enterBox.jsp, admin_rcheckBox.jsp 에서 테이블row 선택시 문서 상세보기로 이동
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String adminDetail(@RequestParam(value="dnum", required=false) String dnum,
							  @RequestParam(value="eno", required=false) String eno,
							  @RequestParam(value="rnum", required=false) String rnum,
							  Model model) {
		if(dnum != null) {
			DocumentBean document = documentDao.getDocumentByDnum(dnum);
			model.addAttribute("document", document);
			return getPage1;
		} else if(eno != null) { 
			EnterBean enter = enterDao.getEnterByEno(eno);
			model.addAttribute("enter", enter);
			return getPage2;
		} else if(rnum != null) {
			ReviewcheckBean review = reviewcheckDao.getRcheckByRnum(rnum);
			model.addAttribute("review", review);
			return getPage3;
		}
		
		return null;
	}
}
