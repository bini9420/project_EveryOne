package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberDao;
import model.AddressBean;
import model.MemberBean;

@Controller
public class InsertAddressController {

	private final String command = "/insertAddress.mb";
	private final String gotoPage = "redirect:/mypage.mb";

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String insertAddr(@ModelAttribute("address") @Valid AddressBean address, BindingResult result,
							HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("현재 클래스: "+this.getClass());
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('배송지 등록 실패 - 입력 누락'); history.back();");
			out.append("</script>");
			return null;
		}
		
		//한 사람당 최대 세개만 등록하기 위해 개수 조회
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		int cnt = -1;
		cnt = memberDao.getAddressCount(member.getId());
		
		
		if(cnt == 3) {
			//조회했더니 3개면 등록 불가
			out.append("<script>");
			out.append("alert('배송지는 최대 3개까지 등록할 수 있습니다.'); location.href='mypage.mb?index=addressInfo'");
			out.append("</script>");
			return null;
		}else {
			//3개가 아니면 등록
			memberDao.insertAddress(address);
			return gotoPage+"?index=addressInfo";
		}
		
	}
}
