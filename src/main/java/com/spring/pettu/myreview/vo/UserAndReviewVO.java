package com.spring.pettu.myreview.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAndReviewVO {

    private long userSeq;
    private String userEmail;
    private String userPw;
    private String userName;
    private String userNickname;
    private String userRole;
    private int userStatus;
    private Date userCreateAt;
    private Date userUpdateAt;

    private MyReviewFileVO myReviewFileVO;
    private List<MyReviewReviewVO> reviewReviewVOList;

}
