package member.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.AddressBean;
import model.MemberBean;
import member.model.MemberDao;  
import model.EnterBean;
import model.ReviewDetailBean;
import utility.ReviewPaging;

@Controller
public class MypageController {

	private final String command = "/mypage.mb";
	private final String getPage = "mypage";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String mypage(@RequestParam(value="index", required=false) String index, 
						@RequestParam(value="anum", required=false) String anum, 		
						@RequestParam(value="rnum", required=false) String rnum, 		
						@RequestParam(value="keyword", required=false) String keyword, 		
						@RequestParam(value="pageNumber", required=false) String pageNumber, 		
						HttpSession session, Model model, HttpServletRequest request) throws IOException {
		
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		
		//������û������ �ִ��� Ȯ��
		EnterBean enter = memberDao.getEnter(member.getId());
		if(enter != null) {
			model.addAttribute("enter", enter);
		}
		
		if(index != null) { //� ��ư�� �����ߴ����� ���� �ٸ� ����� ����
			model.addAttribute("index", index);
			
			if(index.equals("memberInfoUpdate")) {
				model.addAttribute("member", member);
			}
			
			if(index.equals("addressInfo")) {
				List<AddressBean> addressLists = memberDao.getAddressList(member.getId());
				model.addAttribute("addressLists", addressLists);
			}
			
			if(index.equals("updateAddress")) {
				AddressBean address = memberDao.getAddressByAnum(anum);
				model.addAttribute("address", address);
			}
			
			if(index.equals("review")) {
				
				int totalCount = memberDao.getReviewCountById(member.getId());
				String url = request.getContextPath()+this.command+"?id="+member.getId();
				
				ReviewPaging pageInfo = new ReviewPaging(pageNumber, null, totalCount, url, null);
				
				List<ReviewDetailBean> rdetail = memberDao.getReviewById(member.getId(), pageInfo);
				
				model.addAttribute("rdetail", rdetail);
				model.addAttribute("pageInfo", pageInfo);
			}
			
			if(index.equals("updateReview")) {
				ReviewDetailBean rdb = memberDao.getReviewDetailByRnum(rnum);
				model.addAttribute("rdb", rdb);
				model.addAttribute("pageNumber", pageNumber);
			}
		}
		
		return getPage;
	}
	
}
