package com.spring.pettu.hotdeal.service;

import com.spring.pettu.hotdeal.vo.HotdealDTO;
import org.codehaus.jackson.JsonNode;

import java.util.List;

public interface ApiCallerService {
    public JsonNode getApiData(String query, int displayCount);
    public List<HotdealDTO> setHotdealData(JsonNode jsonNode);
    public void saveHotdealToDB(List<HotdealDTO> hlist);// 수정해야 함
}
