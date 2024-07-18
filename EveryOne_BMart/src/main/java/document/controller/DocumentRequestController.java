package document.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;

@Controller
public class DocumentRequestController {
	private final String command = "document_request.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	//GET: document_detailView.jsp���� ��û ��ư Ŭ����
	@RequestMapping(value=command, method=RequestMethod.GET)
	public void requstDocument(@RequestParam("dnum") String dnum, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int cnt = documentDao.requestDocumentByDnum(dnum);
		System.out.println("cnt: " + cnt);
		
		if(cnt > 0) {
			out.println("<script>");
			out.println("alert('�ۼ��Ͻ� ������ ���� ��û�Ǿ����ϴ�');");
			out.println("location.href='document_box.dc';"); 
			out.println("</script>");
			out.flush();
		}
	}
	
	//POST: document_updateForm.jsp���� ��û ��ư Ŭ����
	@RequestMapping(value=command, method=RequestMethod.POST)
	public void requestDocument(DocumentBean document, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//����(title) ����
		if(document.getTitle() == null) {
			document.setTitle(" ");
		}
				
		//����(dcontent) ����
		if(document.getDcontent() == null) {
			document.setDcontent(" ");
		}
			
		//��ǰ ī�װ�(prdcategory) ����
		if(document.getPrdcategory() == null) {
			document.setPrdcategory("prdcategory");
		}
				
		//��ǰ��(prdname) ����
		if(document.getPrdname() == null) {
			document.setPrdname("prdname");
		}
				
		System.out.println("dno: " + document.getDnum());
		System.out.println("dcategory: " + document.getDcategory());
		System.out.println("writer: " + document.getWriter());
		System.out.println("writeday: " + document.getWriteday());
		System.out.println("title: " + document.getTitle());
		System.out.println("dcontent: " + document.getDcontent());
		System.out.println("prdcategory: " + document.getPrdcategory());
		System.out.println("prdname: " + document.getPrdname());
		
		if(documentDao.requestDocument(document) > 0) {
			out.println("<script>");
			out.println("alert('�ۼ��Ͻ� ������ ���� ��û�Ǿ����ϴ�');");
			out.println("location.href='document_box.dc';"); 
			out.println("</script>");
			out.flush();
		}
		
	}
}
