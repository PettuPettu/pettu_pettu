package com.spring.pettu.admin.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SpotJoinCategoryVO {
    private int categorySeq;
    private String categoryName;
    private String spotAreaCode;
    private Date spotCreateDate;
    private String spotLocation;
    private String spotName;
    private String spotOpenApiId;
    private Date spotOpenDate;
    private String spotPicture;
    private int spotSeq;
    private String spotSigunguCode;
    private String spotSubLocation;
    private String spotSubPicture;
    private double spotTotalAvgScore;
    private Date spotUpdateDate;
}
