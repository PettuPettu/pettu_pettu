package com.spring.pettu.review.vo;

import com.spring.pettu.mypage.vo.FileVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {

    private long reviewSeq;          // REVIEW_SEQ
    private Double reviewScore;      // REVIEW_SCORE
    private String reviewTitle;      // REVIEW_TITLE
    private String reviewContents;   // REVIEW_CONTENTS
    private Date reviewCreateDate;   // REVIEW_CREATE_DATE
    private long spotSeq;            // SPOT_SEQ
    private long userSeq;            // USER_SEQ

    private FileVO fileVO; // 파일


}
