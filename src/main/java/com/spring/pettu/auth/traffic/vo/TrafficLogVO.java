package com.spring.pettu.auth.traffic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrafficLogVO {

    private long trafficSeq;
    private String clientIp;
    private String userAgent;
    private String requestUri;
    private Date accessTime;
}
