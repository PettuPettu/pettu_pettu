package com.spring.pettu.hotdeal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HotdealJoinHistoryVO {
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
    int lowPrice;
    Date regitDate;
}
