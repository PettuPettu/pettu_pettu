package com.spring.pettu.hotdeal.service;

import java.util.HashMap;
import java.util.Map;

public class CategoryMapper {
    public String getCategory3(String query) {
        // 상품명 → category3 매핑
        Map<String, String> categoryMap = new HashMap<>();

        categoryMap.put("강아지 사료", "강아지 사료");
        categoryMap.put("고양이 사료", "고양이 사료");
        categoryMap.put("강아지 간식", "강아지 간식");
        categoryMap.put("고양이 간식", "고양이 간식");
        categoryMap.put("강아지 장난감", "강아지 장난감/훈련");
        categoryMap.put("고양이 장난감", "고양이 장난감");
        categoryMap.put("강아지 옷", "패션용품");
        categoryMap.put("고양이 옷", "패션용품");
        categoryMap.put("강아지 배변패드", "강아지 배변용품");
        categoryMap.put("고양이 모래", "고양이 배변용품");

        // 매핑된 값 반환 (없으면 "기타" 반환)
        return categoryMap.get(query);
    }
}
