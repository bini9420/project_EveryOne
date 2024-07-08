package document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DocumentInsertProductController {

	private final String command = "document_insertproduct.dc";
	private final String getPage = "document_insertProduct";
	
	
	@RequestMapping(command)
	public String insert() {
		return getPage;
	}
	
}
