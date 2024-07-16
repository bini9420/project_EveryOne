package document.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;
import document.model.EnterDao;
import document.model.ReviewcheckDao;
import model.MemberBean;

@Controller
public class AdminApprovalController {
	
	private final String command = "admin_approval.dc";
	private final String gotoPage = "redirect:/admin_allBox.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	EnterDao enterDao;
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//GET: admin_documentDetail.jsp에서 승인버튼 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String result(@RequestParam(value="dnum", required=false) String dnum,
						 @RequestParam(value="eno", required=false) String eno,
						 @RequestParam(value="rnum", required=false) String rnum,
						 HttpSession session) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		if(dnum != null) { //상품등록, 광고요청, 폐점신청
			documentDao.updateApproval(dnum);
			DocumentBean db = documentDao.getDocumentByDnum(dnum);
			
			if(db.getDcategory().equals("광고요청")) {
				//product 테이블에 ad 칼럼 변경
			} else if(db.getDcategory().equals("폐점신청")) {
				//business 테이블에서 해당 id 레코드 삭제
			}
			
		} else if(eno != null) { //입점신청
			enterDao.updateApproval(eno);
		} else if(rnum != null) { //리뷰검토
			reviewcheckDao.updateApproval(rnum);
		}
		return gotoPage;
	}
}
