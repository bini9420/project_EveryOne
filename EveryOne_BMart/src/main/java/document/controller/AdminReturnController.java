package document.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentDao;
import document.model.EnterDao;
import document.model.ReviewcheckDao;

@Controller
public class AdminReturnController {
	
	private final String command = "admin_return.dc";
	private final String gotoPage = "redirect:/admin_allBox.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	EnterDao enterDao;
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	@RequestMapping(command)
	public String returnReason(@RequestParam(value="dnum", required=false) String dnum, 
							   @RequestParam(value="eno", required=false) String eno,
							   @RequestParam(value="rnum", required=false) String rnum,
							   @RequestParam("reason") String reason) {
		
		Map<String, String> map = new HashMap<String, String>();
		if(dnum != null) {
			map.put("dnum", dnum);
			map.put("reason", reason);
			
			documentDao.updateReason(map);
		} else if(eno != null) {
			map.put("eno", eno);
			map.put("reason", reason);
			
			enterDao.updateReason(map);
		} else if(rnum != null) {
			map.put("rnum", rnum);
			map.put("reason", reason);
			
			reviewcheckDao.updateReason(map);
		}
		
		return gotoPage;
	}
}
