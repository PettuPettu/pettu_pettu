package com.spring.pettu.auth.easylogin.service;



import com.spring.pettu.auth.easylogin.VO.UsersOauthVO;
import com.spring.pettu.auth.easylogin.VO.UsersTblVO;
import com.spring.pettu.auth.easylogin.social.Oauth;
import com.spring.pettu.auth.easylogin.social.SocialType;
import com.spring.pettu.mapper.OauthMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class OauthServiceImpl implements OauthService {


	private final List<Oauth> socialOauthList;
	private final OauthMapper oauthMapper;
	

	@Override
	//OAuth :: 로그인창 URL 가져오기
	public String svcLoginFormURL(SocialType socialType) {
		//Oauth socialOauth = new GoogleOauth();  //다형성
		//Oauth socialOauth = new KakaoOauth();   //다형성
		Oauth socialOauth = getSocialInstance(socialType);  //new GoogleOauth()
		return socialOauth.getLoginFormURL();
	}


	@Override
	public void svcFormJoin(UsersTblVO usersTblVO) {

	}

	@Override
	public UsersTblVO svcFormLogin(UsersTblVO usersTblVO) {
		return null;
	}

	@Override
	//OAuth :: GOOGLE/KAKAO/NAVER Oauth 클래스 인스턴스 가져오기 - (JDK1.8이상)
	public Oauth getSocialInstance(SocialType socialType) {


//		log.info("Social Type : {}", socialType);
		try {
			for (Oauth oauth : socialOauthList) {
			    if (oauth.type() == socialType) {
		            return oauth;
		        }
		    }
			throw new IllegalArgumentException("Unknown SocialType");
		} catch (IllegalArgumentException e) {
	        throw e; 
	    }
	}

	
	
	@Override
	//OAuth :: 콜백URL을 통한 엑세스 토근 발급
	public Map<String, String> svcRequestAccessToken(SocialType socialType, String code, String state) {
		Oauth socialOauth = getSocialInstance(socialType);   //new GoogleOauth()
		return socialOauth.requestAccessToken(code);
	}

	@Override
	//OAuth :: 엑세스 토근을 사용한 구글서비스(profile) 가져오기
	public Map<String, String> svcRequestUserInfo(SocialType socialType, String accessToken) {
		Oauth socialOauth = getSocialInstance(socialType);     //new GoogleOauth()
		return socialOauth.getUserInfo(accessToken);
	}
	
	@Override
	//OAuth :: 기존회원/신규회원 구분을 위한 DB조회
	public UsersTblVO svcCheckExistUser(String email) {
		UsersTblVO existingUserVO  = oauthMapper.findUserByEmail(email);
		return existingUserVO;
	}
	
	@Override
	//OAuth :: 신규회원: 3.회원정보저장 -->  3.토큰저장  (1: [0,1])
	public int svcInsertToken(UsersTblVO usersTblVO) {
		oauthMapper.insertUsersTbl(usersTblVO);
//        System.out.println("SEQ CURRVAL:" + usersTblVO.getUserSeq());
        
        //user_tbl에 입력한 user_seq 시퀀스번호를 user_oauth의 user_seq값으로 사용
        usersTblVO.getUsersOauthVO().setUserSeq(usersTblVO.getUserSeq());
		oauthMapper.insertUsersOauthTbl(usersTblVO.getUsersOauthVO());
        return usersTblVO.getUserSeq();
	}
		
	@Override
	//OAuth :: 기존회원:토큰갱신
	public void svcUpdateToken(UsersOauthVO usersOauthVO) {
		oauthMapper.updateUserOauthTbl(usersOauthVO);
	}
	
	
}