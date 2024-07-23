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
						 @RequestParam(value="whatColumn", required=false) String whatColumn,
						 @RequestParam(value="inputDnum", required=false) String inputDnum,
					     @RequestParam(value="inputTitle", required=false) String inputTitle,
					     @RequestParam(value="inputDay1", required=false) String inputDay1,
					     @RequestParam(value="inputDay2", required=false) String inputDay2,
					     @RequestParam(value="pageNumber", required=false) String pageNumber,
						 Model model) {
		DocumentBean document = documentDao.getDocumentByDnum(dnum);
		model.addAttribute("document", document);
		
		return getPage;
	}
}
