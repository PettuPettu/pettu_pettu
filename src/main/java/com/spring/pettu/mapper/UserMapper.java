package com.spring.pettu.mapper;

import com.spring.pettu.auth.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    // 이메일 유저 정보 조회 (로그인)
    UserVO findByUserEmail(@Param("userEmail") String userEmail);
    // 시퀀스로 유저 정보 조회
    UserVO findByUserSeq(@Param("userSeq") long userSeq);

    // 닉네임 중복 체크 (0: 사용 가능, 1 이상: 중복)
    UserVO findByUserNickName(@Param("userNickname") String userNickname);

    // 유저 자장
    int saveUser(UserVO userVO);

    // 비밀번호 변경
    int updatePassWord(@Param("userPw") String userPw, @Param("userEmail") String userEmail );


    // Oauth 조회

    // Oauth
}
