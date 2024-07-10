package document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DocumentFormsController {
	
	private final String command = "document_forms.dc";
	private final String getPage = "document_forms";
	
	@RequestMapping(command)
	public String forms() {
		return getPage;
	}
}
 