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
public class MemberInsertController {
	final String command = "aMemberInsert.mb";
	final String gotoPage = "redirect:/aMemberInsert.mb";

	@Autowired
	MemberDao memberDao;

	
	
	//사업자 입점 신청이 들어왔을때 
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String register(	 
							@ModelAttribute("business") @Valid BusinessBean business, 
							BindingResult result,
							HttpServletResponse response) throws IOException {
		
		System.out.println("business.getBcode()"+business.getBcode());
		System.out.println("business.getType()"+business.getType());
		System.out.println("business.getId()"+business.getId());
		
		
		PrintWriter out;
		out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		
		Integer cnt = -1;     
		cnt = memberDao.insertMember(business);
		
		return gotoPage;
	}
}
