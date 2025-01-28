package com.spring.pettu.auth.user.controller;

import com.spring.pettu.auth.user.service.interfaces.UserEmailService;
import com.spring.pettu.auth.user.service.interfaces.UserLoginService;
import com.spring.pettu.auth.user.service.interfaces.UserRegisterService;
import com.spring.pettu.auth.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserLoginService userLoginService;
    private final UserRegisterService userRegisterService;
    private final UserEmailService userEmailService;



    @GetMapping("/login")
    public String loginUser(){
        return "pettu/user/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<?> loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session){
        UserVO user = userLoginService.login(email, password);



        if( user == null){
            log.error("로그인 실패");
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .contentType(MediaType.APPLICATION_JSON)
                    .header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
                    .body("아이디 또는 비밀번호가 오류 입니다.");
        } else {
            session.setAttribute("SESSION_USER_EMAIL", user.getUserRole());
            session.setAttribute("SESSION_USER_ROLE", user.getUserRole());
            log.info("로그인 성공");
            return ResponseEntity.ok().body("success");
        }
    }

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
            log.info("authNumber = {}", authNumber);
            session.setAttribute(email,authNumber);
            session.setAttribute("SESSION_USER_EMAIL", email);
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


    @PostMapping("/api/register/save")
    @ResponseBody
    public ResponseEntity<?> registerUser(@RequestBody UserVO userVO) {

        log.info("userVO = {}", userVO);
       if(userRegisterService.save(userVO) == 0){
           return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
       }
       log.info("유저 회원가입 완료");
        return ResponseEntity.ok().build();
    }


}
