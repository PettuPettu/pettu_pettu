package com.spring.pettu.auth.traffic.service;

import com.spring.pettu.auth.traffic.vo.TrafficLogVO;
import com.spring.pettu.mapper.TrafficMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TrafficLogServiceImpl implements TrafficLogService {
    private final TrafficMapper trafficMapper;

    @Override
    public int save(TrafficLogVO trafficLogVO) {
        return trafficMapper.saveTrafficLog(trafficLogVO);
    }
}
