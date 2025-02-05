package com.spring.pettu.main.service;

import com.spring.pettu.spot.vo.SpotVO;

import java.util.List;
import java.util.Map;

public interface MainService {
    List<Map<String, Object>> selectRecentlyOpenedSpots();
}
