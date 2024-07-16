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

import member.model.MemberDao;
import model.AddressBean;

@Controller
public class UpdateAddressController {

	private final String command = "/updateAddress.mb";
	private final String gotoPage = "redirect:/mypage.mb";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String updateAddr(@ModelAttribute("address") @Valid AddressBean address, BindingResult result,
							HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('����� ���� ���� - �Է� ����'); history.back();");
			out.append("</script>");
			return null;
		}
		
		memberDao.updateAddress(address);
		
		return gotoPage+"?index=addressInfo";
	}
}
