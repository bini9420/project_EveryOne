package notice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
public class descriptionReplyController {
	
	@Autowired
	DescriptionDao desDao;
	
	private final String command = "dreply.nt";
	private final String getPage = "descriptionReply";
	private final String gotoPage = "redirect:/dlist.nt";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String replyForm(@RequestParam("ref") int ref,
							@RequestParam("re_step") int re_step,
							@RequestParam("re_level") int re_level,
							@RequestParam("pageNumber") int pageNumber,
							@RequestParam(value="whatColumn",required=false) String whatColumn,
							@RequestParam(value="keyword",required=false) String keyword,
							HttpSession session,
							Model model) {
		
		model.addAttribute("ref", ref);
        model.addAttribute("re_step", re_step);
        model.addAttribute("re_level", re_level);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("whatColumn", whatColumn);
        model.addAttribute("keyword", keyword);
        
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView reply(@ModelAttribute("db") @Valid DescriptionBean db,
								BindingResult result,
								@RequestParam("ref") int ref,
								@RequestParam("re_step") int re_step,
								@RequestParam("re_level") int re_level,
								@RequestParam("pageNumber") int pageNumber,
								@RequestParam(value="whatColumn",required=false) String whatColumn,
								@RequestParam(value="keyword",required=false) String keyword,
								HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav; 
		}
		db.setRef(ref);
		db.setRe_step(re_step+1);
		db.setRe_level(re_level+1);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
	    map.put("ref", ref);
	    map.put("re_step", re_step);

	    desDao.updateReplyStep(map);
	    desDao.replyDes(db);
		
		mav.setViewName(gotoPage);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("whatColumn", whatColumn);
		mav.addObject("keyword", keyword);
		mav.addObject("ref",ref);
		mav.addObject("re_level",re_level);
		mav.addObject("re_step",re_step);
		mav.addObject("pageNumber",pageNumber);
		return mav;
	}
}
