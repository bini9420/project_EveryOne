package document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;

@Controller
public class DocumentDetailController {

	private final String command = "document_detail.dc";
	private final String getPage = "document_detailView";
	
	@Autowired
	DocumentDao documentDao;
	
	@RequestMapping(command)
	public String detail(@RequestParam("dnum") String dnum,
						 Model model) {
		DocumentBean document = documentDao.getDocumentByDnum(dnum);
		model.addAttribute("document", document);
		
		return getPage;
	}
}
