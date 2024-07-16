package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import model.ReviewBean;

@Controller
public class UpdateReviewController {

	private final String command = "/updateReview.mb";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String updateReview(@ModelAttribute("review") @Valid ReviewBean review, BindingResult result,
							@RequestParam("pageNumber") int pageNumber,
							HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result.hasErrors()) {
			out.append("<script>");
			out.append("alert('상품후기 수정 실패 - 입력 누락'); history.back();");
			out.append("</script>");
			return null;
		}
		
		memberDao.updateReview(review);
		return "redirect:/mypage.mb?index=review&pageNumber="+pageNumber;
	}
}
