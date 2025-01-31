package com.spring.pettu.myreview.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyReviewFileVO {

    private long fileSeq;
    private String orgName;
    private String sysName;
    private Date regdate;
    private long userSeq;
    private String fileSize;
    private int fileType;
    private long reviewSeq;

}