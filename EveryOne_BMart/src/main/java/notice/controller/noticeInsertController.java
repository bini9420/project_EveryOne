package notice.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.NoticeBean;
import notice.model.NoticeDao;

@Controller
public class noticeInsertController {
	
	private final String command = "insert.nt";
	private final String getPage = "noticeInsert";
	private final String gotoPage = "redirect:/list.nt";
	
	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insertForm(HttpSession session, @RequestParam(value = "category", required = false) String category) {
		System.out.println("insert GET");
		 if(session.getAttribute("loginInfo") == null) {
			 session.setAttribute("destination", "redirect:/insert.nt");
			 return "redirect:/login.mb"; 
			 }
		 else { 
			 return getPage; 
			 }
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("notice") @Valid NoticeBean notice,
								BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav; 
		}
		System.out.println("insert POST");
		int cnt = -1;
		cnt = noticeDao.insertNotice(notice);
		
		mav.setViewName(gotoPage);
		return mav;
	}
}
