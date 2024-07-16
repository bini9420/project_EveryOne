package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.MemberBean;

@Controller
public class KakaoLoginController {

	private final String command = "/kakaoLogin.mb";
	private final String gotoPage = "redirect:/main.mall";
	
	@Autowired
	KakaoService kakaoService;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value="code", required=false) String code, HttpSession session) throws Exception {
		System.out.println("#########" + code);
		String access_Token = kakaoService.getAccessToken(code);
		MemberBean authUser = kakaoService.getUserInfo(access_Token);
		
		System.out.println("###access_Token#### : " + access_Token);
		
		
		session.setAttribute("loginInfo", authUser);
		//session.setAttribute("kakaoN", userInfo);
		//session.setAttribute("kakaoE", userInfo.getK_email());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		
		return gotoPage;
	}
}