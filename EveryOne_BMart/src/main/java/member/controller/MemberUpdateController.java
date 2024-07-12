package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import member.model.MemberDao;
import model.MemberBean;

@Controller
public class MemberUpdateController {

	private final String command = "/memberUpdate.mb";
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String memberUpdate(@ModelAttribute("member") @Valid MemberBean member, BindingResult result,
								Model model, HttpServletResponse response, HttpSession session) throws IOException {
		
		System.out.println("member id: "+member.getId());
		System.out.println("���� image: "+member.getUpload2());
		
		//������ ������ �����ͼ� ����
		MultipartFile multi = member.getUpload();
		System.out.println("multi : "+multi);
		System.out.println("���� ������ �̹���: "+multi.getOriginalFilename());
		
		//������ ������ ��ġ ���
		String path = servletContext.getRealPath("/resources/uploadImage/");
		System.out.println("path : "+path);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('������ �κ��� �־ ������ �����߽��ϴ�.'); history.back();");
			out.append("</script>");
			return null;
		}
		
		//�̹����� ������ ������ ���� ���� ����
		memberDao.updateMember(member);
		
		//������ ����� �̹����� ���� ��
		if(member.getUpload2() == null) {
			if(multi.getOriginalFilename() != null) {
				//���� �̹����� ����Ѵٸ�
				File destination = new File(path+File.separator+multi.getOriginalFilename());
				try {
					//�ø��� �۾�
					multi.transferTo(destination);
				}catch (IllegalStateException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
				}
				
				//ȸ���� image�� ����
				member.setImage(multi.getOriginalFilename());
				memberDao.updateMemberImage(member);
				session.setAttribute("loginInfo", member);
			}
		}else {//������ ����� �̹����� ���� ��
			if(multi.getOriginalFilename().length() > 0) {
				System.out.println("������ �̹��� ���� �Ϸ�: "+multi.getOriginalFilename());
				System.out.println("������ �̹���: "+member.getUpload2());
				
				//���� �̹����� ��ġ�� ã�ư��� ����
				File file = new File(path+File.separator+member.getUpload2());
				System.out.println("File : " + file);

				if(file.exists()) {
					file.delete();
				}
				
				//���ο� �̹��� ���ε�
				File destination = new File(path+File.separator+multi.getOriginalFilename());
				try {
					//�ø��� �۾�
					multi.transferTo(destination);
				}catch (IllegalStateException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
				}
				
				//ȸ���� image�� ����
				member.setImage(multi.getOriginalFilename());
				memberDao.updateMemberImage(member);
				session.setAttribute("loginInfo", member);
			}
		}
		
		out.append("<script>");
		out.append("alert('�����Ǿ����ϴ�!'); location.href='mypage.mb'");
		out.append("</script>");
		return null;
	}
}
