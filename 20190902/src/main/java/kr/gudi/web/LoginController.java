package kr.gudi.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONObject;

@Controller
public class LoginController {
	/******************************************************************
	 * 카카오 로그인
	 * 1) 카카오 사이트 권한 요청 > code
	 * 2) 카카오 사용자 토큰 발행 요청 > token
	 * 3) 카카오 사용자 정보 요청 > 해당 token 사용자 정보 받기
	 ******************************************************************/
	@RequestMapping("/login")
	public void login(HttpServletRequest req, HttpServletResponse res) {
		try {
			String url = "https://kauth.kakao.com/oauth/authorize";
			url += "?client_id=24a9cf2f6258f5b091fcf38880647a8e&redirect_uri=";
			url += URLEncoder.encode("http://gdj16.gudi.kr:20010/KakaoBack", "UTF-8");
			url += "&response_type=code";
			System.out.println(url);
			res.sendRedirect(url);
		} catch (UnsupportedEncodingException e)  {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/KakaoBack")
	public void KakaoBack(HttpServletRequest req, HttpServletResponse res) {
		try {
			System.out.println("KakaoBack");
			String code = req.getParameter("code");
			System.out.println(code);
			String url = "https://kauth.kakao.com/oauth/token";
			url += "?client_id=24a9cf2f6258f5b091fcf38880647a8e&redirect_uri=";
			url += URLEncoder.encode("http://gdj16.gudi.kr:20010/KakaoBack", "UTF-8");
			url += "&code=" + code;
			url += "&grant_type=authorization_code";
			System.out.println(url);
			HashMap<String, Object> resultMap = HttpUtil.getUrl(url);
			System.out.println(resultMap);
			
			String userUrl = "https://kapi.kakao.com/v2/user/me";
			userUrl += "?access_token=" + resultMap.get("access_token");
			System.out.println(userUrl);
			resultMap = HttpUtil.getUrl(userUrl);
			System.out.println(resultMap);
				
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
