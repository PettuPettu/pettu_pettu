package com.spring.pettu.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAndFileVO {

    private long userSeq;
    private String userEmail;
    private String userPw;
    private String userName;
    private String userNickname;
    private String userRole;
    private int userStatus;
    private Date userCreateAt;
    private Date userUpdateAt;

    private FileVO fileVO;
    private List<PetVO> petList;

}
