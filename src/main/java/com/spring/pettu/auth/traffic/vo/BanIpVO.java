package com.spring.pettu.auth.traffic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BanIpVO {
    private long ip;
    private String clientIp;
}
