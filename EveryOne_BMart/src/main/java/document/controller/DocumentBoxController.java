package document.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;
import model.MemberBean;
import utility.PagingPlus;

@Controller
public class DocumentBoxController {
	
	private final String command = "/document_box.dc";
	private final String getPage = "document_box";
	
	@Autowired
	DocumentDao documentDao;	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String main(@RequestParam(value="whatColumn", required=false) String whatColumn,
					   @RequestParam(value="inputDnum", required=false) String inputDnum,
					   @RequestParam(value="inputTitle", required=false) String inputTitle,
					   @RequestParam(value="inputDay1", required=false) String inputDay1,
					   @RequestParam(value="inputDay2", required=false) String inputDay2,
					   @RequestParam(value="pageNumber", required=false) String pageNumber,
					   HttpServletRequest request,
					   HttpSession session,
					   Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("pageNumber: " + pageNumber);

		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("inputDnum", "%" + (inputDnum != null ? inputDnum : "") + "%");
	    map.put("inputTitle", "%" + (inputTitle != null ? inputTitle : "") + "%");
		map.put("inputDay1", inputDay1);
		map.put("inputDay2", inputDay2);
		map.put("id", mb.getId());
		
		int totalCount = documentDao.getTotalCount(map);
		String url = request.getContextPath() + this.command;
		
		PagingPlus pageplus = new PagingPlus(pageNumber, null, totalCount, url, whatColumn, inputDnum, inputTitle, inputDay1, inputDay2);
		model.addAttribute("pageplus", pageplus);
		
		//��ü ����
		List<DocumentBean> lists = documentDao.getAllDocument(map, pageplus); 
		model.addAttribute("lists", lists);
		System.out.println("lists ����: " + lists.size());
		
		//������ �Ǽ�
		int waitDocumentCount = documentDao.getWaitDocument(mb.getId());
		model.addAttribute("waitDocumentCount", waitDocumentCount);
		
		//�ӽ����� �Ǽ�
		int tempDocumentCount = documentDao.getTempDocument(mb.getId());
		model.addAttribute("tempDocumentCount", tempDocumentCount);
		
		//�ݷ����� �Ǽ�
		int returnDocumentCount = documentDao.getReturnDocument(mb.getId());
		model.addAttribute("returnDocumentCount", returnDocumentCount);
		
		//����Ϸ� �Ǽ�
		int approveDocumentCount = documentDao.getApproveDocument(mb.getId());
		model.addAttribute("approveDocumentCount", approveDocumentCount);
		
		return getPage;
	}
}
