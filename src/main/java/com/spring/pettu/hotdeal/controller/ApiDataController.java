package com.spring.pettu.hotdeal.controller;

import com.spring.pettu.hotdeal.service.ApiCallerServiceImpl;
import com.spring.pettu.hotdeal.vo.HotdealDTO;
import lombok.RequiredArgsConstructor;
import org.codehaus.jackson.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/apiData")
public class ApiDataController {

    private final ApiCallerServiceImpl apiCallerService;
    private static final Logger logger = LoggerFactory.getLogger(ApiDataController.class);

    @PostMapping("/insertData")
    public String insertApiData(Model model, @RequestParam String keyword, @RequestParam int limit){
        JsonNode request = apiCallerService.getApiData(keyword, limit);
        System.out.println(request);

        List<HotdealDTO> hlist = apiCallerService.setHotdealData(request);

        if (!hlist.isEmpty()) {
            apiCallerService.saveHotdealToDB(hlist);
            model.addAttribute("message", "데이터 삽입 및 갱신 완료");
        } else {
            model.addAttribute("message", "데이터 삽입 및 갱신 실패");
        }

        return "redirect:/";
    }

}
