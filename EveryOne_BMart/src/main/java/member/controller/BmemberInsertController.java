package member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.BusinessBean;
import member.model.MemberDao;

@Controller
public class BmemberInsertController {
	final String command = "BMemberInsert.mb";
	final String gotoPage = "redirect:/bMemberList.mb";

	@Autowired
	MemberDao memberDao;



	//사업자 입점 신청이 들어왔을때 
	@RequestMapping(value=command)
	public String insertMem( @ModelAttribute("business") BusinessBean business, HttpServletResponse response) throws IOException {

		System.out.println("business.getBcode()"+business.getBcode());
		System.out.println("business.getType()"+business.getType());
		System.out.println("business.getId()"+business.getId());


		int cnt = -1;     
		cnt = memberDao.insertBMember(business);
		System.out.println("Binsert count: "+cnt);

		return gotoPage;
	}
}
