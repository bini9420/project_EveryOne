package member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberDao;
import model.DescriptionBean;
import model.MemberBean;

@Controller
public class OwnerController {
	
	private final String command = "omain.mb";
	private final String getPage = "/owner/o_main";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String main(HttpSession session, Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		//o_top.jsp �κ� �˸�â(�� ���) Ŭ���� �������� �Խñ� �ֱ� 5�������� ����
		List<DescriptionBean> d_lists = memberDao.getDescriptionForOwner(mb.getId());
		model.addAttribute("d_lists", d_lists);
		model.addAttribute("dcount", d_lists.size());
		
		return getPage;
	}
} 
