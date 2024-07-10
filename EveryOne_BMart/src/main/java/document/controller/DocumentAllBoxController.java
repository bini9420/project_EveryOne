package document.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;

@Controller
public class DocumentAllBoxController {
	
	private final String command = "document_allBox.dc";
	private final String getPage = "document_allBox";
	
	@Autowired
	DocumentDao documentDao;
	
	@RequestMapping(command)
	public String allBox(@RequestParam(value="whatColumn", required=false) String whatColumn,
					 	 @RequestParam(value="keyword", required=false) String keyword,
					  	 @RequestParam(value="pageNumber", required=false) String pageNumber,
					  	 Model model) {
		
		//��������
		List<DocumentBean> wlists = documentDao.getWaitDocumentList();
		model.addAttribute("wlists", wlists);
		
		//����Ϸ���
		List<DocumentBean> alists = documentDao.getApproveDocumentList();
		model.addAttribute("alists", alists);
		
		//�ӽ�������
		List<DocumentBean> tlists = documentDao.getTempDocumentList();
		model.addAttribute("tlists", tlists);
		
		//�ݷ���
		List<DocumentBean> rlists = documentDao.getReturnDocumentList();
		model.addAttribute("rlists", rlists);
		
		return getPage;
	}

}
