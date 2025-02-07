//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.spring.pettu.auth.traffic.service;

import com.spring.pettu.auth.traffic.vo.BanIpVO;
import com.spring.pettu.auth.traffic.vo.DateCountDTO;
import com.spring.pettu.auth.traffic.vo.TrafficLogVO;
import com.spring.pettu.mapper.TrafficMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TrafficLogServiceImpl implements TrafficLogService {
    private final TrafficMapper trafficMapper;

    public int save(TrafficLogVO trafficLogVO) {
        return trafficMapper.saveTrafficLog(trafficLogVO);
    }

    public int saveBanIp(String clientIp) {
        return trafficMapper.addBanIp(clientIp);
    }

    public  BanIpVO getBanIp(String ip) {
        return trafficMapper.findIp(ip);
    }

    public List<BanIpVO> findBanIpList() {
        return trafficMapper.findBanIpList();
    }

    public int deleteBanIp(String ip) {
        return trafficMapper.deleteBanIp(ip);
    }

    @Override
    public  List<DateCountDTO>  getResultPbti() {
        return trafficMapper.getResultPbti();
    }

    @Override
    public List<DateCountDTO> findDateCount() {
        return trafficMapper.findDateCount();
    }


}
