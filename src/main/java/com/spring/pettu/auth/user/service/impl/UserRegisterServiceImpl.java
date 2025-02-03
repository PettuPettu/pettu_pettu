package com.spring.pettu.auth.user.service.impl;

import com.spring.pettu.auth.user.service.interfaces.UserRegisterService;
import com.spring.pettu.auth.user.vo.UserVO;
import com.spring.pettu.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserRegisterServiceImpl implements UserRegisterService {

    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;


    @Override
    public UserVO findByEmail(String email) {
        return userMapper.findByUserEmail(email);
    }

    @Override
    public UserVO findByUserSeq(long userSeq) {
        return userMapper.findByUserSeq(userSeq);
    }

    @Override
    public boolean findByUserNickName(String userNickname) {
        return userMapper.findByUserNickName(userNickname) != null;
    }

    @Override
    public int save(UserVO userVO) {
        // 중복 검사
        if(findByEmail(userVO.getUserEmail()) != null || findByUserNickName(userVO.getUserNickname())) {
            return 0;
        }

        // OAuth 사용자 여부 확인
        if (userVO.getUserProvider() == null) {  // 일반 회원가입인 경우
            userVO.setUserPw(passwordEncoder.encode(userVO.getUserPw()));
        }

        return userMapper.saveUser(userVO);
    }

    // 비밀번호 변경
    @Override
    public int updateUserPwd(UserVO userVO) {
        String userPw = passwordEncoder.encode(userVO.getUserPw());
        return userMapper.updatePassWord(userPw, userVO.getUserEmail());
    }
}
