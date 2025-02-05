package com.spring.pettu.auth.user.controller;

import com.spring.pettu.auth.user.service.interfaces.UserEmailService;
import com.spring.pettu.auth.user.service.interfaces.UserLoginService;
import com.spring.pettu.auth.user.service.interfaces.UserRegisterService;
import com.spring.pettu.auth.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserLoginService userLoginService;
    private final UserRegisterService userRegisterService;
    private final UserEmailService userEmailService;


    // 로그인
    @GetMapping("/login")
    public String loginUser(){
        return "pettu/user/login";
    }


    // 로그인 검증
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<?> loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam(required = false) String redirectURL,
            HttpSession session) {

        UserVO user = userLoginService.login(email, password);

        if (user == null) {
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .build();
        } else if(user.getUserStatus() != 1){
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .body("errorcode_1");
        } else {
            session.setAttribute("SESSION_USER_EMAIL", user.getUserEmail());
            session.setAttribute("SESSION_USER_CODE", user.getUserSeq());
            session.setAttribute("SESSION_USER_ROLE", user.getUserRole());

            Map<String, Object> response = new HashMap<>();
            response.put("status", "success");
            response.put("redirectURL", redirectURL != null ? redirectURL : "/");

            return ResponseEntity.ok().body(response);
        }
    }


    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session , HttpServletResponse response) {
        // 브라우저 캐시 방지 헤더
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");


        session.invalidate();
        return "redirect:/";
    }


    // 회원가입 페이지로 이동
    @GetMapping("/register")
    public String registerUser(){
        return "pettu/user/register";
    }

    // 이메일 유효성 검사
    @PostMapping("/api/register/check-email")
    @ResponseBody
    public ResponseEntity<?> checkUserEmail(@RequestParam("email") String email, HttpSession session){
        UserVO user = userRegisterService.findByEmail(email);
        if(user == null){
            int authNumber = userEmailService.sendAuthEmail(email);
            session.setAttribute(email,authNumber);
            return ResponseEntity.ok("success");
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

    // 인증코드 확인
    @PostMapping("/api/register/check-code")
    @ResponseBody
    public ResponseEntity<?> checkUserCode(@RequestParam("email") String email,
                                           @RequestParam("code") int code, HttpSession session){

        if((int) session.getAttribute(email) == code){
            return ResponseEntity.ok("success");
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    // 닉네임 중복 확인
    @PostMapping("/api/register/check-nickname")
    @ResponseBody
    public ResponseEntity<?> checkUserNickName(@RequestParam("nickname") String nickname){

        if(userRegisterService.findByUserNickName(nickname)){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
        return ResponseEntity.ok().build();
    }

    // 회원가입 검증
    @PostMapping("/api/register/save")
    @ResponseBody
    public ResponseEntity<?> registerUser(@RequestBody UserVO userVO, HttpSession session) {

       if(userRegisterService.save(userVO) == 0){
           return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
       }
       session.invalidate();
        return ResponseEntity.ok().build();
    }

    // 비밀번호 찾기 이메일
    @PostMapping("/api/password-reset/check-email")
    @ResponseBody
    public ResponseEntity<?> pwResetEmail(@RequestParam("email") String email, HttpSession session){
        UserVO user = userRegisterService.findByEmail(email);
        if(user != null){
            int authNumber = userEmailService.sendAuthEmail(email);
            session.setAttribute(email,authNumber);
            return ResponseEntity.ok("success");
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }



    //비밀번호 찾기
    @GetMapping("/password-reset")
    public String passwordReset(){
        return "pettu/user/find_pw";
    }

    // 비밀번호 변경
    @PostMapping("/api/password/reset")
    @ResponseBody
    public ResponseEntity<?> resetPassword(@RequestBody UserVO userVO , HttpSession session) {
        if(userRegisterService.updateUserPwd(userVO) == 0){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
        session.invalidate();
        return ResponseEntity.ok().build();
    }


}
