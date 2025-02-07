package com.spring.pettu.hotdeal.service;

import com.spring.pettu.common.exception.BusinessException;
import com.spring.pettu.common.exception.ErrorCode;
import com.spring.pettu.hotdeal.vo.HotdealDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.codehaus.jackson.JsonNode;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
@EnableScheduling
public class ScheduledUpdateHotdeal {

    private final ApiCallerServiceImpl apiCallerService;

    @Scheduled(cron = "0 0 0,12 * * ?") //매일 자정과 오정에 insert, update 실행
    public void autoUpdateHotdeal() {
        String[] keyword = {"강아지 사료", "고양이 사료", "강아지 간식", "고양이 간식", "강아지 장난감", "고양이 장난감", "강아지 옷", "고양이 옷", "강아지 배변패드", "고양이 모래"};
        int limit = 50;

        for (String item : keyword){
            autoInsertApiData(item, limit);
        }
    }

    public void autoInsertApiData(String keywords, int limits) {

        JsonNode request = apiCallerService.getApiData(keywords, limits);
        List<HotdealDTO> hlist = apiCallerService.setHotdealData(request);
        Map<String, String> response = new HashMap<>();
        if (!hlist.isEmpty()) {
            apiCallerService.saveHotdealToDB(hlist);
        } else {
            throw new BusinessException(ErrorCode.MISS_PARSSING);
        }
    }
}
