package com.spring.pettu.hotdeal.controller;

import com.spring.pettu.hotdeal.service.ApiCallerServiceImpl;
import com.spring.pettu.hotdeal.vo.HotdealDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.codehaus.jackson.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/apiData")
@Slf4j
public class ApiDataController {

    private final ApiCallerServiceImpl apiCallerService;


    @PostMapping("/insertData")
    @ResponseBody
    public Map<String, String> insertApiData(@RequestParam String keyword, @RequestParam int limit){

        JsonNode request = apiCallerService.getApiData(keyword, limit);
        List<HotdealDTO> hlist = apiCallerService.setHotdealData(request);
        Map<String, String> response = new HashMap<>();
        if (!hlist.isEmpty()) {
            apiCallerService.saveHotdealToDB(hlist);
            response.put("status", "success");
            response.put("message", "데이터 삽입 및 갱신 완료");
        } else {
            response.put("status", "fail");
            response.put("message", "데이터 삽입 및 갱신 실패");
        }
        return response;
    }

}
