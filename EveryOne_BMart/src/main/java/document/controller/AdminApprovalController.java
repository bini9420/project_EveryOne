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
	
	//GET: admin_documentDetail.jsp���� ���ι�ư Ŭ����
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String result(@RequestParam(value="dnum", required=false) String dnum,
						 @RequestParam(value="eno", required=false) String eno,
						 @RequestParam(value="rnum", required=false) String rnum,
						 HttpSession session) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		if(dnum != null) { //��ǰ���, �����û, ������û
			documentDao.updateApproval(dnum);
			DocumentBean db = documentDao.getDocumentByDnum(dnum);
			
			if(db.getDcategory().equals("�����û")) {
				//product ���̺� ad Į�� ����
			} else if(db.getDcategory().equals("������û")) {
				//business ���̺��� �ش� id ���ڵ� ����
			}
			
		} else if(eno != null) { //������û
			enterDao.updateApproval(eno);
		} else if(rnum != null) { //�������
			reviewcheckDao.updateApproval(rnum);
		}
		return gotoPage;
	}
}
