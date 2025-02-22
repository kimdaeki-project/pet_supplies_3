package com.pet.p1.member;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pet.p1.memberReview.MemberReviewVO;
import com.pet.p1.util.Pager;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;


	public String getAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=ccfe4411fa1bfc86a27222555a4dba8c");
			sb.append("&redirect_uri=http://localhost:8080/p1/member/kakaoLogin");
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responsCode:"+responseCode);
			
			// 요청을 통해 얻은 Json타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response Body:"+ result);
			
//		    Json 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token:"+access_Token);
			System.out.println("refresh_token:"+refresh_Token);
			
			br.close();
			bw.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	//kakao 로그인
	public HashMap<String, Object> getmemberInfo(String access_Token){
		
		//요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap 타입으로 선언
		
		HashMap<String, Object> memberInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			
			//요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization","Bearer "+access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode:" + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response body:" + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().getAsJsonObject("properties").getAsJsonObject();
//			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("profile").getAsJsonObject();
			long id = element.getAsJsonObject().get("id").getAsLong();
			
//			String image = kakao_account.getAsJsonObject().get("profile_image_url").getAsString(); //카카오 프로필사진가져오기
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String kakaoId = Long.toString(id);
			
			memberInfo.put("nickname", nickname);
			memberInfo.put("kakaoId", kakaoId);
//			memberInfo.put("image", image);
			
		}catch (Exception e) {
			 e.printStackTrace();
		}
		
		return memberInfo;
		
	}
	
		//kakao 로그아웃
		public void kakaoLogout(String access_Token) {
			String reqURL = "https://kapi.kakao.com/v1/user/logout";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				int responsCode = conn.getResponseCode();
				System.out.println("responsCode: "+responsCode);
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String result = "";
				String line = "";
				
				while((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println(result);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//-- 로그인
		public void naverLogin(String access_token)throws Exception {
			
			String token = access_token;// 네아로 접근 토큰 값";
	        String header = "Bearer " + token; // Bearer 다음에 공백 추가
	        try {
	            String apiURL = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	         
	            System.out.println(response.toString());
	            br.close();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
		}
		
	
	public Long memberCart(MemberVO memberVO)throws Exception{
		return memberDAO.memberCart(memberVO);
	}
	
	public List<MemberVO> memberList(Pager memberPager)throws Exception{
		memberPager.makeRow();
		long totalCount = memberDAO.memberCount(memberPager);
		memberPager.makePage(totalCount);
		return memberDAO.memberList(memberPager);
	}

	public int memberUpdate(MemberVO memberVO)throws Exception{
		return memberDAO.memberUpdate(memberVO);
	}
	
	public int memberDelete(MemberVO memberVO) throws Exception{
		return memberDAO.memberDelete(memberVO);
	}
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return memberDAO.memberLogin(memberVO);
	}
	
	public int memberJoin(MemberVO memberVO, HttpSession session)throws Exception{
		return memberDAO.memberJoin(memberVO);
	}
	
	public int snsJoin(MemberVO memberVO, HttpSession session)throws Exception{
		return memberDAO.snsJoin(memberVO);
	}
	
	public MemberVO snsLogin(MemberVO memberVO)throws Exception{
		return memberDAO.snsLogin(memberVO);
	}
	
	public MemberVO selectPW(MemberVO memberVO)throws Exception{
		return memberDAO.selectPW(memberVO);
	}
	
	public MemberVO memberEMCheck(MemberVO memberVO)throws Exception{
		return memberDAO.memberEMCheck(memberVO);
	}
	
	public MemberVO memberIdCheck(MemberVO memberVO)throws Exception{
		return memberDAO.memberIdCheck(memberVO);
	}
	
	public MemberVO findPhone(MemberVO memberVO)throws Exception{
		return memberDAO.findPhone(memberVO);
	}
	
	public int memberDeletes(List<String> list)throws Exception{
		return memberDAO.memberDeletes(list);
	}
	public long orderCount(MemberVO memberVO) throws Exception{
		return memberDAO.orderCount(memberVO);
	}
	public int pointUpdate(MemberVO memberVO)throws Exception{
		return memberDAO.pointUpdate(memberVO);
	}
	
	public Long couponCount(MemberVO memberVO)throws Exception{
		return memberDAO.couponCount(memberVO);
	}
	
	public List<MemberReviewVO> memberReview(MemberVO memberVO)throws Exception{
		return memberDAO.memberReview(memberVO);
	}
	

}