package notice.controller;

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

import model.NoticeBean;
import notice.model.NoticeDao;

@Controller
public class noticeUpdateController {
	
	@Autowired
	NoticeDao noticeDao;
	
	private final String command = "update.nt";
	private final String gotoPage = "noticeUpdate";
	private final String getPage = "redirect:/list.nt";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String updateForm(@RequestParam(value="nnum") int nnum,
							@RequestParam(value="pageNumber", required=false) String pageNumber,
							@RequestParam(value = "category", required = false) String category,
							Model model) {
		
		NoticeBean nb = noticeDao.viewContent(nnum);
		model.addAttribute("notice", nb);
		model.addAttribute("pageNumber" , pageNumber);
		
		return gotoPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("notice") @Valid NoticeBean notice,
						BindingResult result,
						@RequestParam("pageNumber") int pageNumber,
						@RequestParam(value = "category", required = false) String category){
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(gotoPage);
			return mav;
		}
		
		int cnt = noticeDao.updateNotice(notice);
		
		mav.setViewName(getPage);
		mav.addObject("pageNumber", pageNumber);
		
		return mav;
	}
}
