package com.spring.pettu.auth.user.service.interfaces;

import com.spring.pettu.auth.user.vo.UserVO;

public interface UserLoginService extends UserService {

    UserVO login(String userEmail, String password);

}
