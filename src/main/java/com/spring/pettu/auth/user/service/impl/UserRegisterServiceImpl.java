package com.spring.pettu.auth.user.service.impl;

import com.spring.pettu.auth.user.service.interfaces.UserRegisterService;
import com.spring.pettu.auth.user.vo.UserVO;
import com.spring.pettu.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserRegisterServiceImpl implements UserRegisterService {

    private final UserMapper userMapper;

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
        return userMapper.saveUser(userVO);
    }
}
