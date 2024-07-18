package notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.DescriptionBean;
import model.MemberBean;
import notice.model.DescriptionDao;

@Controller
public class descriptionContentController {

	@Autowired
	DescriptionDao desDao;

	private final String command = "dcontent.nt";
	private final String gotoPage = "descriptionContent";
	private final String getPage = "AdescriptionContent";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String dcontent(@RequestParam(value = "dnum", required = true) int dnum,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword, HttpSession session, Model model) {

		if (session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/dcontent.nt?dnum=" + dnum + "&pageNumber=" + pageNumber
					+ "&whatColumn=" + whatColumn + "&keyword=" + keyword);
			return "redirect:/login.mb";
		} else {
			MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
			String id = loginInfo.getId();
			DescriptionBean db = desDao.viewDes(dnum);

			model.addAttribute("db", db);
			model.addAttribute("pageNumber", pageNumber);
			model.addAttribute("whatColumn", whatColumn);
			model.addAttribute("keyword", keyword);
			if (id != null && "admin".equals(id)) {
				return getPage;
			}
			return gotoPage;
		}
	}
}
