package com.spring.pettu.hotdeal.service;

import com.spring.pettu.hotdeal.vo.HotdealVO;
import org.codehaus.jackson.JsonNode;

import java.util.List;

public interface ApiCallerService {
    public JsonNode getApiData(String query, int displayCount);
    public List<HotdealVO> setHotdealData(JsonNode jsonNode); // 수정해야 함
}
