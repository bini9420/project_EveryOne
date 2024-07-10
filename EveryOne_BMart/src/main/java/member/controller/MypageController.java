package member.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.AddressBean;
import member.model.EnterBean;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MypageController {

	private final String command = "/mypage.mb";
	private final String getPage = "mypage";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String mypage(@RequestParam(value="index", required=false) String index, 
						@RequestParam(value="anum", required=false) String anum, 			
						HttpSession session, Model model) throws IOException {
		
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		
		//입점요청내역이 있는지 확인
		EnterBean enter = memberDao.getEnter(member.getId());
		if(enter != null) {
			model.addAttribute("enter", enter);
		}
		
		if(index != null) { //어떤 버튼을 선택했는지에 따라서 다른 결과를 리턴
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
		}
		
		return getPage;
	}
	
}
