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
public class HotdealVO {
    int proSeq;
    String link;
    String image;
    String brand;
    String maker;
    String category1;
    String category2;
    String category3;
    String category4;
    int productId;
}
