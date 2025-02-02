package com.spring.pettu.hotdeal.vo;
/*
시퀀스: HOTDEAL_SEQ
* */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HotdealDTO { //Json에서 값을 가져오는 용도
    private String title;
    private String link;
    private String image;
    private String brand;
    private String maker;
    private String category1;
    private String category2;
    private String category3;
    private String category4;
    private String productId;
    private String lprice; // 추가
    private String hprice; // 추가
    private String productType; // 추가
    private String mallName; // 추가
}
