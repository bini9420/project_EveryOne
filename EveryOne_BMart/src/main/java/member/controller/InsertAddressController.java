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
		System.out.println("���� Ŭ����: "+this.getClass());
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('����� ��� ���� - �Է� ����'); history.back();");
			out.append("</script>");
			return null;
		}
		
		//�� ����� �ִ� ������ ����ϱ� ���� ���� ��ȸ
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		int cnt = -1;
		cnt = memberDao.getAddressCount(member.getId());
		
		
		if(cnt == 3) {
			//��ȸ�ߴ��� 3���� ��� �Ұ�
			out.append("<script>");
			out.append("alert('������� �ִ� 3������ ����� �� �ֽ��ϴ�.'); location.href='mypage.mb?index=addressInfo'");
			out.append("</script>");
			return null;
		}else {
			//3���� �ƴϸ� ���
			memberDao.insertAddress(address);
			return gotoPage+"?index=addressInfo";
		}
		
	}
}
