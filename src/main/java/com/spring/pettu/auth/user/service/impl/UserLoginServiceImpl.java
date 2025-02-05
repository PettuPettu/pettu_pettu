package com.spring.pettu.auth.user.service.impl;

import com.spring.pettu.auth.user.service.interfaces.UserLoginService;
import com.spring.pettu.auth.user.vo.UserVO;
import com.spring.pettu.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserLoginServiceImpl implements UserLoginService {

    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public UserVO login(String userEmail, String password) {
        UserVO user = userMapper.findByUserEmail(userEmail);
        // 사용자가 존재하고 비밀번호가 일치하는 경우에만 로그인 성공
        if (user != null && passwordEncoder.matches(password, user.getUserPw())) {
            return user;
        }

        return null;
    }

}
