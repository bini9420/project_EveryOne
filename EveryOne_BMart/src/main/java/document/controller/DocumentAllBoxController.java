package document.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;
import member.model.MemberBean;

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
					  	 HttpSession session,
					  	 Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		//결재대기함
		List<DocumentBean> wlists = documentDao.getWaitDocumentList(mb.getId()); 
		model.addAttribute("wlists", wlists);
		
		//결재완료함
		List<DocumentBean> alists = documentDao.getApproveDocumentList(mb.getId());
		model.addAttribute("alists", alists);
		
		//임시저장함
		List<DocumentBean> tlists = documentDao.getTempDocumentList(mb.getId());
		model.addAttribute("tlists", tlists);
		
		//반려함
		List<DocumentBean> rlists = documentDao.getReturnDocumentList(mb.getId());
		model.addAttribute("rlists", rlists);
		
		return getPage;
	}

}
