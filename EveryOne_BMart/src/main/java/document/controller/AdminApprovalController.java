package document.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

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
import model.EnterBean;
import model.MemberBean;
import model.ReviewcheckBean;

@Controller
public class AdminApprovalController {
	
	private final String command = "admin_approval.dc";
	
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
			
			if(db.getDcategory().equals("��ǰ���")) { //prdcategory�� �Էµ� ���� ���� category ���̺� �ִ��� Ȯ��, ������ �߰�
				String prdcategory = documentDao.getPrdcategory(dnum);
				int count = documentDao.checkPrdcategory(prdcategory);
				if(count == 0) {
					documentDao.insertCategory(prdcategory);
				}
			}
			else if(db.getDcategory().equals("�����û")) { //product ���̺� ad Į�� ����
				String pname = documentDao.getPrdname(dnum);
				documentDao.updateProductAd(pname);
				
			} else if(db.getDcategory().equals("������û")) { //business ���̺��� �ش� id ���ڵ� ����
				String writer = documentDao.getWriter(dnum);
				documentDao.deleteBusinessId(writer);
			}
			
			out.println("<script>");
			out.println("alert('���簡 �Ϸ�Ǿ����ϴ�.'); location.href='admin_allBox.dc'");
			out.println("</script>");
			out.flush();
		} else if(eno != null) { //������û
			enterDao.updateApproval(eno);
			EnterBean eb = 	enterDao.getEnterByEno(eno);
			enterDao.insertBusiness(eb);
			
			out.println("<script>");
			out.println("alert('���簡 �Ϸ�Ǿ����ϴ�.'); location.href='admin_enterBox.dc'");
			out.println("</script>");
			out.flush();
		} else if(rnum != null) { //�������
			reviewcheckDao.updateApproval(rnum);
			
			ReviewcheckBean rcheck = reviewcheckDao.getRcheckByRnum(rnum);
			System.out.println("id: " + rcheck.getRe_writer());
			System.out.println("pnum: " + rcheck.getPrdnum());
			System.out.println("re_writeday: " + rcheck.getRe_writeday());
			
			// ���ڿ��� LocalDateTime ��ü�� �Ľ�
	        LocalDateTime datetime = LocalDateTime.parse(rcheck.getRe_writeday(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
	        // LocalDateTime ��ü���� LocalDate ��ü(��¥ �κ�)�� ����
	        LocalDateTime dateOnly = datetime.toLocalDate().atStartOfDay();
	        // ��¥�� ���ϴ� �������� ������ (��: "yyyy-MM-dd")
	        String re_writeday = dateOnly.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("pnum", rcheck.getPrdnum());
			map.put("rdate", re_writeday);
			map.put("id", rcheck.getRe_writer());
			
			//���õ� ��������û �������� �����ۼ���, �����ۼ����� �������� review ���̺��� ���ڵ� ����
			reviewcheckDao.deleteReview(map);
			
			out.println("<script>");
			out.println("alert('���簡 �Ϸ�Ǿ����ϴ�.'); location.href='admin_rcheckBox.dc'");
			out.println("</script>");
			out.flush();
		}
		return null;
	}
}
	
