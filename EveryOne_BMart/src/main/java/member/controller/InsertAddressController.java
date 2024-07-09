package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.AddressBean;

@Controller
public class InsertAddressController {

	private final String command = "/insertAddress.mb";
	private final String gotoPage = "redirect:/mypage.mall";

	@RequestMapping(command)
	public String insertAddr(@ModelAttribute("address") @Valid AddressBean address, BindingResult result,
							HttpServletResponse response) throws IOException {
		System.out.println("현재 클래스: "+this.getClass());
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('배송지 등록 실패 - 주소 누락'); history.back();");
			out.append("</script>");
			return null;
		}
		
		return gotoPage+"?index=addressInfo";
	}
}
