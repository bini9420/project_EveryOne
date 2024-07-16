package document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentDao;
import document.model.ReviewcheckDao;

@Controller
public class RcheckDeleteController {
	private final String command = "rcheckDelete.dc";
	private final String gotoPage = "redirect:/rcheckList.dc";
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	@RequestMapping(command)
	public String deleteDocument(@RequestParam("rnum") String rnum) {
		System.out.println("rnum: " + rnum);
		reviewcheckDao.deleteReviewCheck(rnum);
		return gotoPage;
	}
}
