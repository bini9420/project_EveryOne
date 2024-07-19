package document.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import document.model.DocumentDao;
import document.model.EnterDao;
import document.model.ReviewcheckDao;

@Controller
public class AdminReturnController {
	
	private final String command = "admin_return.dc";
	private final String gotoPage1 = "redirect:/admin_allBox.dc";
	private final String gotoPage2 = "redirect:/admin_allBox.dc";
	private final String gotoPage3 = "redirect:/admin_rcheckBox.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	EnterDao enterDao;
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	@RequestMapping(command)
	public ModelAndView returnReason(@RequestParam(value="dnum", required=false) String dnum, 
							   @RequestParam(value="eno", required=false) String eno,
							   @RequestParam(value="rnum", required=false) String rnum,
							   @RequestParam("reason") String reason) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, String> map = new HashMap<String, String>();
		if(dnum != null) {
			map.put("dnum", dnum);
			map.put("reason", reason);
			
			documentDao.updateReason(map);
			mav.setViewName("redirect:/admin_allBox.dc");
		} else if(eno != null) {
			map.put("eno", eno);
			map.put("reason", reason);
			
			enterDao.updateReason(map);
			mav.setViewName("redirect:/admin_enterBox.dc");
		} else if(rnum != null) {
			map.put("rnum", rnum);
			map.put("reason", reason);
			
			reviewcheckDao.updateReason(map);
			mav.setViewName("redirect:/admin_rcheckBox.dc");
		}
		
		return mav;
	}
}
