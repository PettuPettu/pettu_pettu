package com.spring.pettu.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileVO {

    private long fileSeq;
    private String orgName;
    private String sysName;
    private Date regdate;
    private long userSeq;
    private String fileSize;
    private int fileType;
    private long petSeq;
}
