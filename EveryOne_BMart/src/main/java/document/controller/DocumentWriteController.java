package document.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import document.model.DocumentBean;
import document.model.DocumentDao;
import model.MemberBean;

@Controller
public class DocumentWriteController {
	
	private final String command = "document_write.dc";
	private final String getPage = "document_writeForm";
	private final String gotoPage = "redirect:/document_box.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	ServletContext servletContext;
	
	//GET: o_top.jsp���� �����û Ŭ����
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		model.addAttribute("name", mb.getName());
				
		return getPage;
	}
	
	
	//POST: document_writeForm.jsp���� ��û Ŭ����
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String write(@ModelAttribute("document") DocumentBean document, BindingResult result,
						HttpSession session, Model model) {
		if(result.hasErrors()) {
			return getPage;
		}
		String category = document.getDcategory();
		System.out.println("category: " + category);
		
		//������ȣ(dnum) ����
		int maxNum = documentDao.whatNumber(category);
		System.out.println("maxNum: " + maxNum);
		String num = (String.valueOf(maxNum+1));
		System.out.println("num: " + num);
		String dnum = "";
		
		if(category.equals("��ǰ���")) {
			dnum += "B-" + num;
		} else if(category.equals("�����û")) {
			dnum += "C-" + num; 
		} else if(category.equals("�����û")) {
			dnum += "D-" + num;
		} 
		document.setDnum(dnum);
		
		//�ۼ���(writer) ����
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		document.setWriter(mb.getId()); 
		
		int cnt = -1;
		cnt = documentDao.insertDocument(document);
		if(cnt > 0) {
			return gotoPage;
		}
		return getPage;
	}
	
}
