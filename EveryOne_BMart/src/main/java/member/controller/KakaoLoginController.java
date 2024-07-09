package member.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class KakaoLoginController {
	
	private final KakaoApi kakaoApi = null;
	private final String command="/login/oauth2/code/kakao";
	
	
	@RequestMapping("login")
	public String loginForm(Model model) {
		model.addAttribute("kakaoApiKey",kakaoApi.getKakaoApiKey());
		model.addAttribute("redirectUri",kakaoApi.getKakaoRedirectUri());
		return "login";
	}
	
	@RequestMapping(command)
	public String kakao(@RequestParam String code) {
		
		String accessToken = kakaoApi.getAccessToken(code);
		
		Map<String,Object> userInfo = kakaoApi.getUserInfo(accessToken);
		
		String email = (String)userInfo.get("email");
		
		System.out.println("email="+email);
		
		return "redirect:/loginForm";
		
		
	}
	
	
	
	
	
}
