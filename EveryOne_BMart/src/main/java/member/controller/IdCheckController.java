package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;

@Controller
public class IdCheckController {

	private final String command = "/idCheck.mb";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	@ResponseBody
	public String check(@RequestParam("id") String id) {
		
		int count = memberDao.checkId(id);

		if(count > 0) { //중복된 아이디가 있으면
			return "no";
		}else {
			return "yes";
		}
	}
}