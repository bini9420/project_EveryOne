package document.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import document.model.DocumentBean;
import document.model.DocumentDao;
import model.MemberBean;

@Controller
public class DocumentWriteController {
	
	private final String command = "document_write.dc";
	private final String getPage = "document_writeForm";
	private final String gotoPage = "redirect:/document_box.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	ServletContext servletContext;
	
	//GET: o_top.jsp에서 결재요청 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		model.addAttribute("name", mb.getName());
				
		return getPage;
	}
	
	
	//POST: document_writeForm.jsp에서 요청 클릭시
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String write(@ModelAttribute("document") DocumentBean document, BindingResult result,
						HttpSession session, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		if(result.hasErrors()) {
			return getPage;
		}
		String category = document.getDcategory();
		System.out.println("category: " + category);
		
		//문서번호(dnum) 설정
		int maxNum = documentDao.whatNumber(category);
		System.out.println("maxNum: " + maxNum);
		String num = (String.valueOf(maxNum+1));
		System.out.println("num: " + num);
		String dnum = "";
		
		if(category.equals("상품등록")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", mb.getId());
			map.put("prdcategory", document.getPrdcategory()); 
			
			int count = documentDao.getPrdcategoryById(map); //결재 Form에 작성한 상품 카테고리로 신청한 적이 있는지 조회
			System.out.println("count: " + count);
			if(count == 0) {
				dnum += "B-" + num;
			} else if(count > 0){
				out.println("<script>");
				out.println("alert('입력하신 상품 카테고리로 작성한 상품등록문서가 존재합니다'); location.href='omain.mb'");
				out.println("</script>");
				out.flush();
				
				return null;
			}
		} else if(category.equals("광고요청")) {
			dnum += "C-" + num; 
		} else if(category.equals("폐업요청")) {
			dnum += "D-" + num;
		} 
		document.setDnum(dnum);
		
		//상품카테고리(prdcategory) 설정
		if(document.getPrdcategory() == null) {
			document.setPrdcategory("X");
		}
		
		//작성자(writer) 설정
		document.setWriter(mb.getId()); 
		
		int cnt = -1;
		cnt = documentDao.insertDocument(document);
		if(cnt > 0) {
			return gotoPage;
		}
		return getPage;
	}
	
}
