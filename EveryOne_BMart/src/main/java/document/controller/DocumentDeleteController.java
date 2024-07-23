package document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String deleteDocument(@RequestParam("dnum") String dnum,
						 @RequestParam(value="whatColumn", required=false) String whatColumn,
						 @RequestParam(value="inputDnum", required=false) String inputDnum,
					     @RequestParam(value="inputTitle", required=false) String inputTitle,
					     @RequestParam(value="inputDay1", required=false) String inputDay1,
					     @RequestParam(value="inputDay2", required=false) String inputDay2,
					     @RequestParam(value="pageNumber", required=false) String pageNumber,
						 Model model) {
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("inputDnum", inputDnum);
		model.addAttribute("inputTitle", inputTitle);
		model.addAttribute("inputDay1", inputDay1);
		model.addAttribute("inputDay2", inputDay2);
		model.addAttribute("pageNumber", pageNumber);
		
		documentDao.deleteDocument(dnum);
		return gotoPage;
	}
}
