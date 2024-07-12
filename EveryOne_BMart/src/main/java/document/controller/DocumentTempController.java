package document.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import document.model.DocumentBean;
import document.model.DocumentDao;
import model.MemberBean;
import utility.Paging;

@Controller
public class DocumentTempController {

	private final String command = "document_temp.dc";
	private final String getPage = "document_tempBox";
	private final String gotoPage = "redirect:/document_box.dc";

	@Autowired
	DocumentDao documentDao;

	@Autowired
	ServletContext servletContext;

	// GET: document_box.jsp에서 임시저장 카드 클릭, o_top.jsp에서 임시저장함 클릭
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String temp(@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, HttpServletRequest request,
			HttpSession session, Model model) {
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");

		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyowrd", "%" + keyword + "%");
		map.put("id", mb.getId());

		int totalCount = documentDao.getTempCount(map);
		String url = request.getContextPath() + this.command;

		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		model.addAttribute("pageInfo", pageInfo);

		List<DocumentBean> lists = documentDao.getAllTempDocument(map, pageInfo);
		model.addAttribute("lists", lists);

		return getPage;
	}

	// POST: document_writeForm.jsp에서 임시저장 클릭
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String temp(DocumentBean document, HttpSession session) {
		
		  System.out.println("writer: " + document.getWriter()); //null
		  System.out.println("writeday: " + document.getWriteday()); //null
		  System.out.println("title: " + document.getTitle()); //null
		  System.out.println("dcontent: " + document.getDcontent()); //null
		 
		String category = document.getDcategory();

		// 문서번호(dnum) 설정
		int maxNum = documentDao.whatNumber(category);
		String num = (String.valueOf(maxNum + 1));
		String dnum = "";

		if (category.equals("상품등록")) {
			dnum += "B-" + num;
		} else if (category.equals("광고요청")) {
			dnum += "C-" + num;
		} else if (category.equals("폐업요청")) {
			dnum += "D-" + num;
		}
		document.setDnum(dnum);

		// 작성자(writer) 설정
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
		document.setWriter(mb.getId());

		// 상품명(prdname) 설정
		if (document.getPrdname() == null) {
			document.setPrdname("X");
		}

		// 상품 카테고리(prdcategory) 설정
		if (document.getPrdcategory() == null) {
			document.setPrdcategory("X");
		}

		int cnt = -1;
		cnt = documentDao.tempSaveDocument(document);
		if (cnt > 0) {
			return gotoPage;
		} else {
			return getPage;
		}

	}
}
