package com.spring.pettu.mapper;

import com.spring.pettu.auth.traffic.vo.TrafficLogVO;
import com.spring.pettu.test.vo.TestEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TrafficMapper {

    int saveTrafficLog(TrafficLogVO trafficLogVO);
}

