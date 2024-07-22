package notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.DescriptionBean;
import notice.model.DescriptionDao;

@Controller
public class descriptionUpdateController {

	@Autowired
	DescriptionDao desDao;

	private final String command = "dupdate.nt";
	private final String getPage = "descriptionUpdate";
	private final String gotoPage = "redirect:/dlist.nt";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String updateDes(@RequestParam(value = "dnum", required = true) int dnum,
			@RequestParam(value = "pageNumber", required = true) int pageNumber,
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword, HttpSession session, Model model) {

		DescriptionBean db = desDao.viewDes(dnum);
		model.addAttribute("db", db);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView Dupdate(@ModelAttribute("db") @Valid DescriptionBean db, BindingResult result,
			@RequestParam("pageNumber") int pageNumber, @RequestParam("whatColumn") String whatColumn,
			@RequestParam("keyword") String keyword, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		if (result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		int cnt = -1;
		cnt = desDao.updateDes(db);

		if (cnt == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
				out.flush();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		mav.setViewName(gotoPage);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("whatColumn", whatColumn);
		mav.addObject("keyword", keyword);

		return mav;

	}

}
