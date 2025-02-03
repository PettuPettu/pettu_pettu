package com.spring.pettu.spot.vo;

import com.spring.pettu.review.vo.ReviewVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SpotVO {
    private long spotSeq;
    private long categorySeq;
    private String spotName;
    private String spotLocation;
    private String spotSubLocation;
    private long spotSigunguCode;
    private long spotAreaCode;
    private String spotPicture;
    private String spotSubPicture;

    private Date spotOpenDate;
    private Date spotCreateDate;
    private Date spotUpdateDate;
    private long spotOpenApiId;

    // 리뷰 전체 평점
    private int spotTotalAvgScore;

    /*----------- top3 ---------------*/
    // 리뷰 총 갯수 : (top3 위한 컬럼)
    private int reviewTotalCnt;

    // 최근 (한달) 리뷰 올라간 갯수 : (top3 위한 컬럼)
    private int reviewMonthlyCnt;
    /*--------------------------------*/


    /*----------- store-detail.jsp 의 리뷰 리스트 ---------------*/
    // 해당하는 시설의 리뷰 리스트 :
    List<ReviewVO> reviewList;

}

