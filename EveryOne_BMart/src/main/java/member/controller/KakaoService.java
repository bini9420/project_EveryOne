package member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import member.model.MemberDao;
import model.MemberBean;

@Service
public class KakaoService {
	
	@Autowired
	MemberDao memberDao;
	KakaoService() {};
	
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=f851426109160a96d2785229bdb40d68"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/ex/kakaoLogin.mb"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	// 카카오 로그인 정보 저장
	public MemberBean getUserInfo(String access_Token) {
		
		 //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		MemberBean member = new MemberBean();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			int length = kakao_account.getAsJsonObject().get("email").getAsString().length();
			int place = kakao_account.getAsJsonObject().get("email").getAsString().indexOf("@");
			
			String email1 = kakao_account.getAsJsonObject().get("email").getAsString().substring(0, place);
			String email2 = kakao_account.getAsJsonObject().get("email").getAsString().substring(place+1, length);
			System.out.println("email1: "+email1);
			System.out.println("email2: "+email2);
			
			String id = email1;
			System.out.println("id : "+id);
			
			member.setId(id);
			member.setEmail1(email1);
			member.setEmail2(email2);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 정보가 저장되있는지 확인하는 코드.
		MemberBean result = memberDao.findkakao(member);
		System.out.println("S:" + result);
		
		if(result == null) {
		// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			
			memberDao.kakaoinsert(member);
			
			//정보 저장 후 컨트롤러에 정보를 보내는 코드
			//result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
			return memberDao.findkakao(member);
			
		} else {
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}
	        
	}

}
