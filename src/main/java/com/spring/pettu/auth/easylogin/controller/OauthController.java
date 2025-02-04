package com.spring.pettu.auth.easylogin.controller;

import com.spring.pettu.auth.easylogin.VO.UsersOauthVO;
import com.spring.pettu.auth.easylogin.VO.UsersTblVO;
import com.spring.pettu.auth.easylogin.service.OauthService;
import com.spring.pettu.auth.easylogin.social.SocialType;
import com.spring.pettu.auth.user.service.interfaces.UserLoginService;
import com.spring.pettu.auth.user.service.interfaces.UserRegisterService;
import com.spring.pettu.auth.user.service.interfaces.UserService;
import com.spring.pettu.auth.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class OauthController {


    private final OauthService oauthService;
    private final UserRegisterService userRegisterService;

    /**
     * 구글/네이버/카카오로 로그인 시 로그인창 이동 --> 회원 동의 후 /oauth2callback 자동 호출
     *
     * @param socialType (GOOGLE, NAVER, KAKAO)
     */
    //http://localhost:8089/login/GOOGLE
    @RequestMapping(value = "/login/{socialType}", method = RequestMethod.GET)
    public String loginForm(Model model
            , @PathVariable("socialType") SocialType socialType
            , HttpServletRequest request) {
        String loginFormUrl = oauthService.svcLoginFormURL(socialType);


        request.getSession().setAttribute("SESS_SOCIALTYPE", socialType);
        return "redirect:" + loginFormUrl;
    }

    /**
     * callback 통해 access token 획득 후 신규회원(회원가입페이지)/기존회원(토큰저장 후 마이페이지) 이동
     *
     * @param socialType (GOOGLE, NAVER, KAKAO)
     *                   http://localhost:8089/oauth2callback/GOOGLE
     *                   http://localhost:8089/oauth2callback/KAKAO
     *                   http://localhost:8089/oauth2callback/NAVER
     */
    //http://localhost:8089/oauth2callback/GOOGLE
//	@GetMapping("/oauth2callback/{socialType}")
    @GetMapping("/pettu/oauth/callback/{socialType}")
    public String ctlCallback(Model model, @PathVariable("socialType") SocialType socialType,
                              @RequestParam("code") String code,
                              @RequestParam(value = "state", required = false) String state, HttpSession session) {
        //??????
        socialType = (SocialType) session.getAttribute("SESS_SOCIALTYPE");
//        log.info("socialType: " + socialType);

        //CODE를 사용해 ACCESS TOKEN 받기
        Map<String, String> responseMap = oauthService.svcRequestAccessToken(socialType, code, state);
        String accessToken = (String) responseMap.get("access_token");
        String refreshToken = (String) responseMap.get("refresh_token");

//        log.info("accessToken: " + accessToken);
//        log.info("refreshToken: " + refreshToken);

        Map<String, String> userInfo = oauthService.svcRequestUserInfo(socialType, accessToken);

//		log.info("userInfo: " + userInfo);

        //userInfo.get("email")을 사용해 DB조회(기존회원 & 신규회원)
        UserVO existingUserVO = userRegisterService.findByEmail(userInfo.get("email"));


        String viewPage = "redirect:/";
        if (userInfo != null) {

            if (existingUserVO == null) {
                //OAuth :: 신규 회원일 경우 -- accessToken : 세션에 담고 추가 회원가입페이지로 이동
                // redirectAttribute에 담으면 되는거 아닌가? --- 의문
                session.setAttribute("SESS_EMAIL", userInfo.get("email"));
                session.setAttribute("SESS_PROVIDER", socialType);
//				session.setAttribute("SESS_PICTURE"		, userInfo.get("picture"));
                session.setAttribute("SESS_NAME", userInfo.get("name"));
                session.setAttribute("SESS_ACCESS_TOKEN", accessToken);
                session.setAttribute("SESS_REFRESH_TOKEN", refreshToken);
                model.addAttribute("user", existingUserVO);
                viewPage = "redirect:/easy/register";
            } else {

                if (!socialType.toString().equals(existingUserVO.getUserProvider())) {
                    session.setAttribute("ANOTHER_EMAIL", "이미 등록된 이메일 입니다.");
                    return "redirect:/login";
                }

                //OAuth :: 기존 회원일 경우 -- 토큰만 다시 저장(변경이 있을 수 있으므로)
                //토큰정보
                UsersOauthVO usersOauthVO = new UsersOauthVO();
                usersOauthVO.setPicture(userInfo.get("picture"));
                usersOauthVO.setAccessToken(accessToken);
                usersOauthVO.setRefreshToken(refreshToken);
                usersOauthVO.setUserSeq((int) existingUserVO.getUserSeq());

                session.setAttribute("SESSION_USER_EMAIL", existingUserVO.getUserEmail());
                session.setAttribute("SESSION_USER_CODE", existingUserVO.getUserSeq());
                session.setAttribute("SESSION_USER_ROLE", existingUserVO.getUserRole());
            }
        }
        return viewPage;
    }

    @GetMapping("/easy/register")
    public String easyRegister() {
        return "pettu/user/easy_register";
    }

    //OAuth :: 신규회원: 회원정보저장 + 토큰저장
    @PostMapping("/easy/register")
    @ResponseBody
    public ResponseEntity<?> ctlOauthJoinProcess(HttpServletRequest request,
                                                 @RequestBody UserVO userVO) {
        //토큰정보
        UsersOauthVO usersOauthVO = new UsersOauthVO();
        usersOauthVO.setPicture((String) request.getSession().getAttribute("SESS_PICTURE"));
        usersOauthVO.setAccessToken((String) request.getSession().getAttribute("SESS_ACCESS_TOKEN"));
        usersOauthVO.setRefreshToken((String) request.getSession().getAttribute("SESS_REFRESH_TOKEN"));

        //회원정보
        userVO.setUserEmail((String) request.getSession().getAttribute("SESS_EMAIL"));
        //usersTblVO.setUserName(userName);
        userVO.setUserProvider(request.getSession().getAttribute("SESS_PROVIDER").toString());

//		usersTblVO.setUsersOauthVO(usersOauthVO);  //회원정보에 토큰정보 담기
//        log.info("userVO: " + userVO);
        int insertUserSeq = userRegisterService.save(userVO);

        if (insertUserSeq < 0) {
            return ResponseEntity.badRequest().build();
        } else {
            //회원가입성공 : /로 이동
            //전체 세션 삭제
            request.getSession().invalidate();
        }
        return ResponseEntity.ok().build();
    }

}