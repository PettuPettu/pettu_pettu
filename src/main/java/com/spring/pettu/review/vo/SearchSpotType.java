package com.spring.pettu.review.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchSpotType {

    // 장소 : 시군구 코드 : 세부 코드 | EX ) 경기도 파주시
    long spotSigunguCode;

    // 장소 : 도 코드 : areacode 경기도 / 서울특별시
    long spotAreaCode;

    // 카테고리 ID [ 관광타입 ID ] : contentTypeId  | EX ) 음식점 :38번
    long categorySeq;

    // 가게 이름검색
    String spotName;

}
