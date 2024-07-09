package member.controller;

import java.util.Map;

public interface KakaoApi {

	Object getKakaoApiKey();

	Object getKakaoRedirectUri();

	String getAccessToken(String code);

	Map<String, Object> getUserInfo(String accessToken);

}
