package com.spring.pettu.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MainVO {
    private long spotSeq;
    private String spotPicture;
    private String spotName;
    private String categoryName;
    private String spotLocation;
    private Date spotOpenDate;
    private float spotTotalAvgScore;
}
