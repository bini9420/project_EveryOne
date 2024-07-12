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

	// GET: document_box.jsp���� �ӽ����� ī�� Ŭ��, o_top.jsp���� �ӽ������� Ŭ��
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

	// POST: document_writeForm.jsp���� �ӽ����� Ŭ��
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String temp(DocumentBean document, HttpSession session) {
		
		  System.out.println("writer: " + document.getWriter()); //null
		  System.out.println("writeday: " + document.getWriteday()); //null
		  System.out.println("title: " + document.getTitle()); //null
		  System.out.println("dcontent: " + document.getDcontent()); //null
		 
		String category = document.getDcategory();

		// ������ȣ(dnum) ����
		int maxNum = documentDao.whatNumber(category);
		String num = (String.valueOf(maxNum + 1));
		String dnum = "";

		if (category.equals("��ǰ���")) {
			dnum += "B-" + num;
		} else if (category.equals("�����û")) {
			dnum += "C-" + num;
		} else if (category.equals("�����û")) {
			dnum += "D-" + num;
		}
		document.setDnum(dnum);

		// �ۼ���(writer) ����
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
		document.setWriter(mb.getId());

		// ��ǰ��(prdname) ����
		if (document.getPrdname() == null) {
			document.setPrdname("X");
		}

		// ��ǰ ī�װ�(prdcategory) ����
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
