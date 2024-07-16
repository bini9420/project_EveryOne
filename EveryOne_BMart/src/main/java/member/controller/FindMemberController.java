package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import model.MemberBean;

@Controller
public class FindMemberController {

	private final String command = "/find.mb";
	
	@Autowired
	MemberDao memberDao;
	
	//���̵� ã���� ��
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String findId(@RequestParam("name") String name, @RequestParam("phone1") String phone1,
						@RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3,
						HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(name.equals("") || phone1.equals("") || phone2.equals("") || phone3.equals("")) {
			out.append("<script>");
			out.append("alert('������ ���� �־ ���̵� ã�⿡ �����߽��ϴ�.'); history.back();");
			out.append("</script>");
			return null;
		}
		
		MemberBean member = new MemberBean();
		member.setName(name);
		member.setPhone1(phone1);
		member.setPhone2(phone2);
		member.setPhone3(phone3);
		
		MemberBean mb = memberDao.getMemberId(member);
		if(mb != null) {
			out.append("<script>");
			out.append("alert('���ǰ� ��ġ�ϴ� ȸ���� ã�ҽ��ϴ�. ���̵� : "+mb.getId()+"'); location.href='login.mb'; ");
			out.append("</script>");
		}else {
			out.append("<script>");
			out.append("alert('���ǰ� ��ġ�ϴ� ȸ���� �����ϴ�.'); location.href='login.mb'; ");
			out.append("</script>");
		}
		return null;
		
	}
	
	//��й�ȣ ã���� ��
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String findPw(@RequestParam("id") String id, @RequestParam("name") String name,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(id.equals("") || name.equals("")) {
			out.append("<script>");
			out.append("alert('������ ���� �־ ��й�ȣ ã�⿡ �����߽��ϴ�.'); history.back();");
			out.append("</script>");
			return null;
		}
		
		MemberBean member = new MemberBean();
		member.setId(id);
		member.setName(name);
		
		MemberBean mb = memberDao.getMemberPw(member);
		if(mb != null) {
			out.append("<script>");
			out.append("alert('���ǰ� ��ġ�ϴ� ȸ���� ã�ҽ��ϴ�. ��й�ȣ : "+mb.getPassword()+"'); location.href='login.mb'; ");
			out.append("</script>");
		}else {
			out.append("<script>");
			out.append("alert('���ǰ� ��ġ�ϴ� ȸ���� �����ϴ�.'); location.href='login.mb'; ");
			out.append("</script>");
		}
		return null;
		
	}
}