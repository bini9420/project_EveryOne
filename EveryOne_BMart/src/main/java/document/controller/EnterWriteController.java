package document.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.EnterBean;
import document.model.EnterDao;
import model.MemberBean;

@Controller
public class EnterWriteController {

	private final String command = "enter_write.dc";
	private final String getPage = "enter_writeForm";
	private final String gotoPage = "redirect:/main.mall";
	
	@Autowired
	EnterDao enterDao;
	
	@Autowired
	ServletContext servletContext;
	
	//GET: mall_bottom.jsp���� ������û Ŭ���� => enter_writeForm.jsp ���â���� ����
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String enterWrite(@RequestParam("id") String id, Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//���̵� ������ => �α����� �� �ߴٴ� ��
		if(id == "") {
			out.println("<script>");
			out.println("alert('���� ��û�Ϸ��� �α����� �ؾ� �մϴ�.'); location.href='login.mb'");
			out.println("</script>");
			out.flush();
		}
		//���̵� ������ => ������ûForm ���â ����
		return getPage;
	}
	
	//POST: enter_writeForm.jsp ���� ��û��ư Ŭ���� => enter ���̺� insert �۾�
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String enterWrite(EnterBean enter, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//������ȣ(eno) ����
		String maxNum = enterDao.whatEnumber();  
		String num = (String.valueOf(Integer.parseInt(maxNum)+1));
		String eno = "";
		eno += "A-" + num;
		enter.setEno(eno);
		
		//�ۼ���(writer) ����
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		enter.setWriter(mb.getId());
		
		//÷������(originname) ����
		MultipartFile multi = enter.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/document"); //image�� ���ε��ϴ� ��

		//�ش� ���̵�� ������û���� �ִ��� enter ���̺��� Ȯ��
		if(enterDao.checkEnter(mb.getId()) > 0) {
			out.println("<script>");
			out.println("alert('ȸ������ ������û ���� �����մϴ�'); location.href='main.mall'");
			out.println("</script>");
			out.flush();
		} else { //�ش� ���̵�� ������û���� ���� ���
			int cnt = -1;
			cnt = enterDao.insertEnter(enter); 
			if(cnt != -1) { //���� ����
				File destination = new File(uploadPath + "\\" + multi.getOriginalFilename()); // => ����غ��� ���ڿ��� �������� ������ file�� ������
				
				out.println("<script>");
				out.println("alert('������û�� �Ϸ�Ǿ����ϴ�');");
				out.println("</script>");
				out.flush();
				try {
					multi.transferTo(destination); //������ ������ ������ ��ο��ٰ� ���ε��ϴ� ��
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return gotoPage;
	}
}
