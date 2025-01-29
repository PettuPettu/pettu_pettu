package com.spring.pettu.auth.user.service.interfaces;


import com.spring.pettu.auth.user.vo.UserVO;

public interface UserRegisterService extends UserService{



    UserVO findByEmail(String email);
    UserVO findByUserSeq(long userSeq);
    boolean findByUserNickName(String userNickname);
    int save(UserVO userVO);
}
