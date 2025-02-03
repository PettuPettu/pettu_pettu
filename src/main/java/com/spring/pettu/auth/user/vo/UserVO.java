package com.spring.pettu.auth.user.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {

    private long userSeq;
    private String userEmail;
    private String userPw;
    private String userName;
    private String userNickname;
    private String userRole;
    private int userStatus;
    private Date userCreateAt;
    private Date userUpdateAt;
    private String userProvider;

}
