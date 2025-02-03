package com.spring.pettu.review.controller;


import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.review.service.ReviewServiceImpl;
import com.spring.pettu.spot.service.SpotServiceImpl;
import com.spring.pettu.spot.vo.SearchSpotType;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @PostMapping("/upload")
    public String uploadReview(@RequestParam("reviewTitle") String reviewTitle,
                               @RequestParam("reviewContents") String reviewContents,
                               @RequestParam("reviewScore") int reviewScore,
                               @RequestParam("file") MultipartFile file,
                               @RequestParam("userSeq") long userSeq,
                               @RequestParam("spotSeq") long spotSeq) {

        System.out.println("ReviewRestController uploadReview >>>>>> ");
        try {
            // 리뷰와 파일을 업로드하고 리뷰 시퀀스를 반환
            int reviewSeq = rSvc.saveReviewWithImage(reviewTitle, reviewContents, reviewScore, file, userSeq, spotSeq);
            if (reviewSeq > 0) {
                return "리뷰 업로드 성공!";
            } else {
                return "리뷰 업로드 실패";
            }
        } catch (Exception e) {
            return "업로드 중 오류가 발생했습니다: " + e.getMessage();
        }
    }


}
