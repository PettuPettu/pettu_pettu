package com.spring.pettu.hotdeal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HistoryVO {
    int proSeq;
    Date regitDate;
    int rowPrice;

}
