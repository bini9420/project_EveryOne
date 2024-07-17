package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.BusinessBean;
import member.model.MemberDao;

@Controller
public class BmemberInsertController {
	final String command = "BMemberInsert.mb";
	final String gotoPage = "redirect:/bMemberList.mb";

	@Autowired
	MemberDao memberDao;



	//사업자 입점 신청이 들어왔을때 
	@RequestMapping(value=command)
	public String insertMem(	 
		@ModelAttribute("business") BusinessBean business,
		HttpServletResponse response) throws IOException {

		System.out.println("business.getBcode()"+business.getBcode());
		System.out.println("business.getType()"+business.getType());
		System.out.println("business.getId()"+business.getId());


		Integer cnt = -1;     
		cnt = memberDao.insertBMember(business);

		return gotoPage;
	}
}
