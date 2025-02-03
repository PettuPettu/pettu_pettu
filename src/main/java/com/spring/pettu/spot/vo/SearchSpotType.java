package com.spring.pettu.spot.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchSpotType {
    
    private List<String> locations;     // 지역 리스트 : spotAreaCode

    private List<String> categories;    // 카테고리 리스트 : categorySeq
                                        // 카테고리 ID [ 관광타입 ID ] : contentTypeId  | EX ) 음식점 :38번

    private String searchKeyword;        // 검색어 : 시설명 검색


}
