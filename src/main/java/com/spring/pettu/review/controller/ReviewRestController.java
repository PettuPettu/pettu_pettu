package com.spring.pettu.review.controller;


import com.spring.pettu.review.service.ReviewServiceImpl;
import com.spring.pettu.spot.service.SpotServiceImpl;
import com.spring.pettu.spot.vo.SearchSpotType;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/rest/review")
public class ReviewRestController {

    private final ReviewServiceImpl rSvc;

    // spot top3 REST API
    @GetMapping("/list/{storeId}")
    public ResponseEntity<Map<String, Object>> spotListOfTop3(@PathVariable("storeId") Long storeId) {
        SpotVO svo = rSvc.svcSpotAndReviewList(storeId);

        Map<String, Object> response = new HashMap<>();
        response.put("spot", svo);
        response.put("reviewTotalCount", svo.getReviewList().size());

        return ResponseEntity.ok(response);
    }




}
