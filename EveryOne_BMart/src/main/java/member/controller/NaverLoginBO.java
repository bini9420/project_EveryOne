package member.controller;

import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;

@Service
public class NaverLoginBO {

	private final String CLIENT_ID = "OYNrHlNkztOFUhRZwKT4";
	private final String CLIENT_SECRET = "EN31TSZB3t";
	private final String REDIRECT_URI = "http://localhost:8080/ex/naverLogin.mb";
	private final String SESSION_STATE = "oauth_state";
	
	private final String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	
	//���� ����
	public String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	public void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	public String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	
	//���̹� ���̵�� ���� URL ����
	public String getAuthorizationUrl(HttpSession session) {
		String state = generateRandomString();
		setSession(session, state);
		
		OAuth20Service oauthService = new ServiceBuilder()
										.apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URI)
										.state(state).build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	//���̹� ���̵�� callback ó�� �� accesstoken ȹ��
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		String sessionState = getSession(session);
		
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
											.apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URI)
											.state(state).build(NaverLoginApi.instance());
			
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	//accesstoken���� �׺�� ����� ������ apiȣ��
	
}
