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
		System.out.println("기존 image: "+member.getUpload2());
		
		//파일의 정보를 가져와서 저장
		MultipartFile multi = member.getUpload();
		System.out.println("multi : "+multi);
		System.out.println("새로 선택한 이미지: "+multi.getOriginalFilename());
		
		//파일을 저장할 위치 경로
		String path = servletContext.getRealPath("/resources/uploadImage/");
		System.out.println("path : "+path);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('누락된 부분이 있어서 수정에 실패했습니다.'); history.back();");
			out.append("</script>");
			return null;
		}
		
		//이미지를 제외한 나머지 정보 먼저 수정
		memberDao.updateMember(member);
		
		//기존에 등록한 이미지가 없을 때
		if(member.getUpload2() == null) {
			if(multi.getOriginalFilename() != null) {
				//새로 이미지를 등록한다면
				File destination = new File(path+File.separator+multi.getOriginalFilename());
				try {
					//올리는 작업
					multi.transferTo(destination);
				}catch (IllegalStateException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
				}
				
				//회원의 image를 수정
				member.setImage(multi.getOriginalFilename());
				memberDao.updateMemberImage(member);
				session.setAttribute("loginInfo", member);
			}
		}else {//기존에 등록한 이미지가 있을 때
			if(multi.getOriginalFilename().length() > 0) {
				System.out.println("수정할 이미지 선택 완료: "+multi.getOriginalFilename());
				System.out.println("제거할 이미지: "+member.getUpload2());
				
				//기존 이미지의 위치를 찾아가서 제거
				File file = new File(path+File.separator+member.getUpload2());
				System.out.println("File : " + file);

				if(file.exists()) {
					file.delete();
				}
				
				//새로운 이미지 업로드
				File destination = new File(path+File.separator+multi.getOriginalFilename());
				try {
					//올리는 작업
					multi.transferTo(destination);
				}catch (IllegalStateException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
				}
				
				//회원의 image를 수정
				member.setImage(multi.getOriginalFilename());
				memberDao.updateMemberImage(member);
				session.setAttribute("loginInfo", member);
			}
		}
		
		out.append("<script>");
		out.append("alert('수정되었습니다!'); location.href='mypage.mb'");
		out.append("</script>");
		return null;
	}
}
