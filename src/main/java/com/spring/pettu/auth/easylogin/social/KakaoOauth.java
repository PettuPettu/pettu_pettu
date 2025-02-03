package com.spring.pettu.auth.easylogin.social;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Component
@Slf4j
public class KakaoOauth implements Oauth {

    @Value("${kakao.loginform.url}")
    private String LOGIN_FORM_URL;
    @Value("${kakao.client.id}")
    private String CLIENT_ID;
    @Value("${kakao.redirect.uri}")
    private String CALLBACK_URL;
    @Value("${kakao.endpoint.token}")
    private String ENDPOINT_URL_TOKEN;
    @Value("${kakao.endpoint.userinfo}")
    private String ENDPOINT_URL_USERINFO;

    private String ACCESS_TOKEN = "";


    /**
     * 카카오 로그인창 주소
     */
    @Override
    public String getLoginFormURL() {
        String loginFormUrl = LOGIN_FORM_URL
                + "?client_id=" + CLIENT_ID            //
                + "&redirect_uri=" + CALLBACK_URL        //
//				+ "&prompt=login" 					// 항상 로그인 창 띄우기
                + "&response_type=code";            //
        return loginFormUrl;
    }


    /**
     * AccessToken 받기
     */
    @Override
    public Map<String, String> requestAccessToken(String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> bodys = new LinkedMultiValueMap<>();
        bodys.add("code", code);
        bodys.add("client_id", CLIENT_ID);
        bodys.add("grant_type", "authorization_code");
        bodys.add("redirect_uri", CALLBACK_URL);

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(bodys, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map<String, String>> responseEntity = restTemplate.exchange(
                ENDPOINT_URL_TOKEN,
                HttpMethod.POST,
                entity,
                new ParameterizedTypeReference<Map<String, String>>() {
                }
        );

        this.ACCESS_TOKEN = (String) responseEntity.getBody().get("access_token");
//        if (responseEntity.getStatusCode() == HttpStatus.OK)
//            System.out.println(responseEntity.getBody().toString());
        return responseEntity.getBody();
    }

    @Override
    public Map<String, String> getUserInfo(String accessToken) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity<Void> entity = new HttpEntity<>(headers);
        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<Map<String, Object>> responseEntity = restTemplate.exchange(
                ENDPOINT_URL_USERINFO,
                HttpMethod.GET,
                entity,
                new ParameterizedTypeReference<Map<String, Object>>() {
                }
        );

        Map<String, String> userInfo = new HashMap<>();
        // String 으로 변환하기 위해 일단 넣는다. -> 카카오가 주는 데이터는 String, Object 다.
        Map<String, Object> response = responseEntity.getBody();

        if (response != null) {
            // id를 문자열로 변환
            userInfo.put("id", String.valueOf(response.get("id")));
            // properties와 kakao_account에서 필요한 정보 추출
            Map<String, Object> properties = (Map<String, Object>) response.get("properties");
            Map<String, Object> kakaoAccount = (Map<String, Object>) response.get("kakao_account");

            if (properties != null) {
                userInfo.put("name", (String) properties.get("nickname"));
                userInfo.put("profile_image", (String) properties.get("profile_image"));
            }

            if (kakaoAccount != null) {
                userInfo.put("email", (String) kakaoAccount.get("email"));
            }
        }
        return userInfo;
    }

    @Override
    public boolean isTokenExpired(String accessToken) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + accessToken);
            headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            HttpEntity<String> entity = new HttpEntity<>(headers);

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<Map<String, String>> responseEntity = restTemplate.exchange(
                    ENDPOINT_URL_USERINFO,
                    HttpMethod.POST,
                    entity,
                    new ParameterizedTypeReference<Map<String, String>>() {
                    }
            );
//            System.out.println("5.유저정보 응답:" + responseEntity.getBody().toString());
            return false; // 요청 성공 -> 토큰 유효
        } catch (HttpClientErrorException e) {
            if (e.getStatusCode().value() == 401) {
                return true; // 401 Unauthorized -> 토큰 만료
            }
            throw e; // 다른 오류는 예외로 처리
        }
    }

    @Override
    public String getAccessTokenByRefreshToken(String refreshToken) {
        Map<String, String> bodys = new HashMap<>();
        bodys.put("client_id", CLIENT_ID);
        bodys.put("refresh_token", refreshToken);
        bodys.put("grant_type", "refresh_token");

        // HttpEntity (바디) 생성
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Map<String, String>> entity = new HttpEntity<>(bodys);
        ResponseEntity<Map<String, String>> responseEntity = restTemplate.exchange(
                ENDPOINT_URL_TOKEN,
                HttpMethod.POST,
                entity,
                new ParameterizedTypeReference<Map<String, String>>() {
                }
        );
//        System.out.println("4.토큰재발급 응답(body):" + responseEntity.getBody().toString());
        String accessToken = responseEntity.getBody().get("access_token");
//        System.out.println("4.토큰요청 응답(갱신된access_token): " + accessToken);
        return accessToken;
    }

}
