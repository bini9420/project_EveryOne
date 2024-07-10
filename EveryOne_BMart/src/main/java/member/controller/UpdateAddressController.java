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

import member.model.AddressBean;
import member.model.MemberDao;

@Controller
public class UpdateAddressController {

	private final String command = "/updateAddress.mb";
	private final String gotoPage = "redirect:/mypage.mall";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String updateAddr(@ModelAttribute("address") @Valid AddressBean address, BindingResult result,
							HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('배송지 수정 실패 - 입력 누락'); history.back();");
			out.append("</script>");
			return null;
		}
		
		memberDao.updateAddress(address);
		
		return gotoPage+"?index=addressInfo";
	}
}
