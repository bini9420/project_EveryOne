package document.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
import product.model.ProductDao;

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
						 HttpSession session,
						 HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		if(dnum != null) { //��ǰ���, �����û, ������û
			documentDao.updateApproval(dnum);
			DocumentBean db = documentDao.getDocumentByDnum(dnum);
			
			if(db.getDcategory().equals("�����û")) { //product ���̺� ad Į�� ����
				String pname = documentDao.getPrdname(dnum);
				documentDao.updateProductAd(pname);
				
				out.println("<script>");
				out.println("alert('���簡 �Ϸ�Ǿ����ϴ�.'); location.href='admin_allBox.dc'");
				out.println("</script>");
				out.flush();
				
			} else if(db.getDcategory().equals("������û")) { //business ���̺��� �ش� id ���ڵ� ����
				String writer = documentDao.getWriter(dnum);
				documentDao.deleteBusinessId(writer);
			}
			
		} else if(eno != null) { //������û
			enterDao.updateApproval(eno);
		} else if(rnum != null) { //�������
			reviewcheckDao.updateApproval(rnum);
		}
		return gotoPage;
	}
}
