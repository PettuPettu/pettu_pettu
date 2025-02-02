package com.spring.pettu.hotdeal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HotdealVO { // DB에서 값을 가져오는 용도
    private int proSeq;
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
    private int lowPrice;
}
