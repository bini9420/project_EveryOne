package notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.model.DescriptionDao;
import model.MemberBean;

@Controller
public class descriptionDeleteController {
	
	@Autowired
	DescriptionDao desDao;
	
	private final String command = "ddelete.nt";
	private final String gotoPage = "descriptionDelete";
	private final String getPage = "redirect:/dlist.nt";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String deleteDes(@RequestParam(value="dnum") int dnum,
							@RequestParam("pageNumber") int pageNumber,
							@RequestParam("whatColumn") String whatColumn,
							@RequestParam("keyword") String keyword,
							HttpSession session) {
		
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		
		if("admin".equals(loginInfo.getId())) {
			desDao.deleteAdmin(dnum);
			
			return getPage + "?pageNumber=" + pageNumber + "&whatColumn=" + whatColumn + "&keyword=" + keyword;
		}
		
		return gotoPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView ddelete(@RequestParam(value="dnum") int dnum,
								@RequestParam("pageNumber") int pageNumber,
								@RequestParam("whatColumn") String whatColumn,
								@RequestParam("keyword") String keyword,
								HttpServletRequest request,
								HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		String password = request.getParameter("password");
		int cnt = desDao.deleteDes(dnum,password);
		
		if(cnt == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('비밀번호가 일치하지 않습니다'); history.go(-1);</script>");
				out.flush();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		mav.setViewName(getPage);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("whatColumn", whatColumn);
		mav.addObject("keyword", keyword);

		return mav;

	}
}
