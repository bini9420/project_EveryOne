package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class DeleteAddressController {

	private final String command = "/deleteAddress.mb";
	private final String gotoPage = "redirect:/mypage.mall?index=addressInfo";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String deleteAddr(@RequestParam("anum") int anum) {
		
		memberDao.deleteAddress(anum);
		return gotoPage;
	}
}
