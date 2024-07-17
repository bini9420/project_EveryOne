package document.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.EnterBean;
import document.model.EnterDao;
import model.MemberBean;

@Controller
public class EnterWriteController {

	private final String command = "enter_write.dc";
	private final String getPage = "enter_writeForm";
	private final String gotoPage = "redirect:/main.mall";
	
	@Autowired
	EnterDao enterDao;
	
	@Autowired
	ServletContext servletContext;
	
	//GET: mall_bottom.jsp에서 입점신청 클릭시 => enter_writeForm.jsp 모달창으로 띄우기
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String enterWrite(@RequestParam("id") String id, Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//아이디가 없으면 => 로그인을 안 했다는 뜻
		if(id == "") {
			out.println("<script>");
			out.println("alert('입점 신청하려면 로그인을 해야 합니다.'); location.href='login.mb'");
			out.println("</script>");
			out.flush();
		}
		//아이디가 있으면 => 입점신청Form 모달창 띄우기
		return getPage;
	}
	
	//POST: enter_writeForm.jsp 에서 요청버튼 클릭시 => enter 테이블에 insert 작업
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String enterWrite(EnterBean enter, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//문서번호(eno) 설정
		String maxNum = enterDao.whatEnumber();  
		String num = (String.valueOf(Integer.parseInt(maxNum)+1));
		String eno = "";
		eno += "A-" + num;
		enter.setEno(eno);
		
		//작성자(writer) 설정
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		enter.setWriter(mb.getId());
		
		//첨부파일(originname) 설정
		MultipartFile multi = enter.getUpload();
		String uploadPath = servletContext.getRealPath("/resources/document"); //image를 업로드하는 곳

		//해당 아이디로 입점요청건이 있는지 enter 테이블에서 확인
		if(enterDao.checkEnter(mb.getId()) > 0) {
			out.println("<script>");
			out.println("alert('회원님의 입점요청 건이 존재합니다'); location.href='main.mall'");
			out.println("</script>");
			out.flush();
		} else { //해당 아이디로 입점요청건이 없을 경우
			int cnt = -1;
			cnt = enterDao.insertEnter(enter); 
			if(cnt != -1) { //삽입 성공
				File destination = new File(uploadPath + "\\" + multi.getOriginalFilename()); // => 출력해보면 문자열로 나오지만 실제로 file로 생성됨
				
				out.println("<script>");
				out.println("alert('입점요청이 완료되었습니다');");
				out.println("</script>");
				out.flush();
				try {
					multi.transferTo(destination); //생성된 파일을 실제로 경로에다가 업로드하는 것
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return gotoPage;
	}
}
