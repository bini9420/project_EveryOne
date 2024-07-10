package document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentDao;

@Controller
public class DocumentDeleteController {
	
	private final String command = "document_delete.dc";
	private final String gotoPage = "redirect:/document_box.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@RequestMapping(command)
	public String deleteDocument(@RequestParam("dnum") String dnum) {
		documentDao.deleteDocument(dnum);
		return gotoPage;
	}
}
