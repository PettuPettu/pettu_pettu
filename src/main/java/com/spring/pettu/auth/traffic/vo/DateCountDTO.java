package com.spring.pettu.auth.traffic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DateCountDTO {

    private String dateTime;
    private int cnt;
}
