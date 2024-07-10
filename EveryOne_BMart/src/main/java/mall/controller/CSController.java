package mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.MallDao;

@Controller
public class CSController {

	private final String command = "/cs.mall";
	private final String getPage = "cs_main";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(command)
	public String cs() {
		return getPage;
	}
}
