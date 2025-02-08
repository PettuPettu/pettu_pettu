package com.spring.pettu.mapper;

import com.spring.pettu.auth.traffic.vo.BanIpVO;
import com.spring.pettu.auth.traffic.vo.DateCountDTO;
import com.spring.pettu.auth.traffic.vo.TrafficLogVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TrafficMapper {
    int saveTrafficLog(TrafficLogVO trafficLogVO);

    int addBanIp(String clientIp);

    BanIpVO findIp(String ip);

    List<BanIpVO> findBanIpList();

    int deleteBanIp(String ip);

    List<DateCountDTO>  getResultPbti();

    List<DateCountDTO> findDateCount();
}

