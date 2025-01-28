package com.spring.pettu.auth.user.controller;

import com.spring.pettu.auth.user.service.interfaces.UserLoginService;
import com.spring.pettu.auth.user.service.interfaces.UserRegisterService;
import com.spring.pettu.auth.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserLoginService UserLoginService;
    private final UserRegisterService UserRegisterService;
    private final PasswordEncoder passwordEncoder;
    @GetMapping("/login")
    public String loginUser(){

        return "pettu/user/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<?> loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session){
        UserVO user = UserLoginService.login(email, password);
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

    @PostMapping("/api/register/email")
    public ResponseEntity<?> registerUser(@RequestParam("email") String email){

        return ResponseEntity.ok("d");
    }


}
