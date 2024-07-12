package document.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.EnterDao;

@Controller
public class EnterDeleteController {
	private final String command = "enter_delete.dc";

	@Autowired
	EnterDao enterDao;
	
	@RequestMapping(command)
	public void delete(@RequestParam("eno") String eno, HttpServletResponse response) throws IOException {
		//System.out.println("eno: " + eno);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		enterDao.deleteEnter(eno);
		
		out.println("<script>");
		out.println("alert('입점요청이 삭제되었습니다'); location.href='main.mall'");
		out.println("</script>");
		out.flush();
	}
}
