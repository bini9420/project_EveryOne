package document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import document.model.DocumentBean;
import document.model.DocumentDao;
import member.model.MemberDao;

@Controller
public class DocumentWriteController {
	
	private final String command = "document_write.dc";
	private final String getPage = "document_writeForm";
	private final String gotoPage = "";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String write() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String write(@ModelAttribute("document") DocumentBean document) {
		//dcategory, writer, writeday, title, dcontent, orginname
		System.out.println("요청받음");
		return gotoPage;
	}
	
}
