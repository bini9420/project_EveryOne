package document.controller;

import javax.servlet.ServletContext;
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

@Controller
public class DocumentUpdateController {

	private final String command = "document_update.dc";
	private final String getPage = "document_updateForm";
	private final String gotoPage = "redirect:/document_box.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	ServletContext servletContext;
	
	//GET: document_detailView.jsp에서 작성 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String update(@RequestParam("dnum") String dnum, HttpSession session, Model model) {
		System.out.println("dnum: " + dnum);
		
		DocumentBean document = documentDao.getDocumentByDnum(dnum);
		model.addAttribute("document", document);
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		model.addAttribute("loginInfo", mb);
		
		return getPage;
	}
	
	//POST: document_updateForm.jsp에서 임시저장 클릭시
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String update(DocumentBean document, @RequestParam("dnum") String dnum, Model model) {
		//문서번호(dnum) 설정
		document.setDnum(dnum);
	
		//제목(title) 설정
		if(document.getTitle() == null) {
			document.setTitle(" ");
		}
		
		//내용(dcontent) 설정
		if(document.getDcontent() == null) {
			document.setDcontent(" ");
		}
		
		//상품 카테고리(prdcategory) 설정
		if(document.getPrdcategory() == null) {
			document.setPrdcategory("prdcategory");
		}
		
		//상품명(prdname) 설정
		if(document.getPrdname() == null) {
			document.setPrdname("prdname");
		}
		System.out.println("====================================");
		System.out.println("dno: " + document.getDnum());
		System.out.println("dcategory: " + document.getDcategory());
		System.out.println("writer: " + document.getWriter());
		System.out.println("writeday: " + document.getWriteday());
		System.out.println("title: " + document.getTitle());
		System.out.println("dcontent: " + document.getDcontent());
		System.out.println("prdcategory: " + document.getPrdcategory());
		System.out.println("prdname: " + document.getPrdname());
		int cnt = -1;
		cnt = documentDao.updateDocument(document);
		if(cnt > 0) {
			return gotoPage;
		}
		return getPage;
	}
}
