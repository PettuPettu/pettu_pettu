package com.spring.pettu.auth.easylogin.VO;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component   
@Data     
public class UsersOauthVO {
	private int userSeq;
	private String picture;
	private String accessToken;
	private String refreshToken;
	private String uptdate;
}
