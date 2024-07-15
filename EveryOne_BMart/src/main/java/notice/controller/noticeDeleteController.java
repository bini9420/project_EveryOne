package notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.model.NoticeDao;

@Controller
public class noticeDeleteController {

	@Autowired
	NoticeDao noticeDao;
	
	private final String command = "delete.nt";
	private final String gotoPage = "redirect:/list.nt";
	
	@RequestMapping(command)
	public ModelAndView delete(@RequestParam(value="nnum") int nnum,
							@RequestParam(value="pageNumber", required=false) String pageNumber,
							HttpServletResponse response) {
		
		int cnt = noticeDao.deleteNotice(nnum);
		ModelAndView mav = new ModelAndView();
		
		if(cnt == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert(); history.go(-1);</script>");
				out.flush();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
