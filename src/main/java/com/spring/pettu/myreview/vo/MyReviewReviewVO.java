package com.spring.pettu.myreview.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyReviewReviewVO {

    private long reviewSeq;
    private int reviewScore;
    private String reviewTitle;
    private String reviewContents;
    private Date reviewCreateDate;
    private long spotSeq;
    private long userSeq;

    private MyReviewFileVO reviewFile;
}
