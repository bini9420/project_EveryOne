package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.DescriptionBean;
import model.MemberBean;
import notice.model.DescriptionDao;

@Controller
public class descriptionInsertController {
	
	@Autowired
	DescriptionDao desDao;
	
	private final String command = "/dinsert.nt";
	private final String gotoPage = "descriptionInsert";
	private final String goPage = "AdescriptionInsert";
	private final String getPage = "redirect:/dlist.nt";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String dinsertForm(HttpSession session) {
		if(session.getAttribute("loginInfo") == null) { // 
			session.setAttribute("destination", "redirect:/dinsert.nt");
			return "redirect:/login.mb";
		}else {
			MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
	        String id = loginInfo.getId();
			if (id != null && "admin".equals(id)) {
				
				return goPage;
			}else {
			return gotoPage;
			}
		}
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView dinsert(@ModelAttribute("db") @Valid DescriptionBean db,
						BindingResult result,
						HttpServletRequest request,
						HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		String id = loginInfo.getId();
		
		if(result.hasErrors()) {
			mav.setViewName(gotoPage);
			return mav; 
		}
		
		int cnt = -1;
		cnt = desDao.insertDes(db);
		mav.setViewName(getPage);
		
		return mav;
	}
}
