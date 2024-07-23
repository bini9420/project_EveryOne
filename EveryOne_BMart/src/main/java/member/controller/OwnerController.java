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
		
		//main�� 4���� ī�� �Ʒ��� ���� �Խ��� ����
		List<DescriptionBean> dlists = memberDao.getDescriptionForOwner(mb.getId());
		model.addAttribute("dlists", dlists);
		System.out.println("owner ������: " + dlists.size());
		
		return getPage;
	}
} 
