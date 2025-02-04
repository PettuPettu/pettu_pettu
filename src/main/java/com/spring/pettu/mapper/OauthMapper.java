package com.spring.pettu.mapper;


import com.spring.pettu.auth.easylogin.VO.UsersOauthVO;
import com.spring.pettu.auth.easylogin.VO.UsersTblVO;
import com.spring.pettu.auth.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;


@Repository
@Mapper
public interface OauthMapper {
	//일반 회원가입
	public void formJoin(UsersTblVO usersTblVO);
	//일반 로그인
	public UsersTblVO formLogin(UsersTblVO usersTblVO);
	
	public ArrayList<UsersTblVO>  allUser();
	public void insertUsersTbl(UsersTblVO usersTblVO);
	public void updateUserTbl(UsersTblVO usersTblVO);
	public int userDelete(int userSeq);	
	

	//-------------- OAuth 추가 -------------------
	public UsersTblVO findUserByEmail(String userEmail);
	public void insertUsersOauthTbl(UsersOauthVO usersOauthVO);
    public void updateUserOauthTbl(UsersOauthVO usersOauthVO);
	
	
}
