//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.spring.pettu.auth.traffic.service;

import com.spring.pettu.auth.traffic.vo.BanIpVO;
import com.spring.pettu.auth.traffic.vo.DateCountDTO;
import com.spring.pettu.auth.traffic.vo.TrafficLogVO;

import java.util.List;

public interface TrafficLogService {
    int save(TrafficLogVO var1);

    int saveBanIp(String var1);

    BanIpVO getBanIp(String var1);

    List<BanIpVO> findBanIpList();

    int deleteBanIp(String var1);

    List<DateCountDTO>  getResultPbti();
    List<DateCountDTO> findDateCount();
}
