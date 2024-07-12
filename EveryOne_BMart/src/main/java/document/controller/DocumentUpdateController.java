package document.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import document.model.DocumentBean;
import document.model.DocumentDao;
import model.MemberBean;

@Controller
public class DocumentUpdateController {

	private final String command = "document_update.dc";
	private final String getPage = "document_updateForm";
	private final String gotoPage = "redirect:/document_box.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	ServletContext servletContext;
	
	//GET: document_detailView.jsp���� �ۼ� Ŭ����
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String update(@RequestParam("dnum") String dnum, HttpSession session, Model model) {
		DocumentBean document = documentDao.getDocumentByDnum(dnum);
		model.addAttribute("document", document);
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		model.addAttribute("loginInfo", mb);
		
		return getPage;
	}
	
	//POST: document_updateForm.jsp���� ��û Ŭ����
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String update(DocumentBean document, @RequestParam("dnum") String dnum, HttpSession session, Model model) {
		
		//������ȣ(dnum) ����
		document.setDnum(dnum);
		
		//�ۼ���(writer) ����
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		document.setWriter(mb.getId());
	
		//����(title) ����
		if(document.getTitle() == null) {
			document.setTitle(" ");
		}
		
		//����(dcontent) ����
		if(document.getDcontent() == null) {
			document.setDcontent(" ");
		}
		
		if(document.getOrginname().equals("")) {
			document.setOrginname(document.getUpdatename());
		}
		
		int cnt = -1;
		cnt = documentDao.updateDocument(document);
		
		if(cnt != -1) {
			String updatePath = servletContext.getRealPath("/resources/uploadImage");

			File file = new File(updatePath + "\\" + document.getUpdatename());
			file.delete();
			
			MultipartFile multi = document.getUpload();
			File destination = new File(updatePath + "\\" + multi.getOriginalFilename());
			try {
				multi.transferTo(destination);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			return getPage;
		}
		
		return gotoPage;
	}
}
