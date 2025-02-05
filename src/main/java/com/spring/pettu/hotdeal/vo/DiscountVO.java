package com.spring.pettu.hotdeal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DiscountVO {
    int proSeq;
    int recentPrice;
    int prevPrice;
    double discountRate;
    String title;
    String image;
    String category3;
    String brand;
}
