package com.spring.pettu.review.controller;


import com.spring.pettu.auth.user.service.interfaces.UserService;

import com.spring.pettu.review.service.ReviewService;
import com.spring.pettu.review.vo.ReviewVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/rest/review")
public class ReviewRestController {

    private final ReviewService rSvc;

    // spot REST API
    @GetMapping("/list/{spotId}")
    public ResponseEntity<List<ReviewVO>> reviewListWithImage(@PathVariable("spotId") long spotId) {
        System.out.println("reviewListWithImage start");
        List<ReviewVO> slist = rSvc.svcReviewListWithImage(spotId);
        System.out.println("리스트 사이즈 "+slist.size());
        return new ResponseEntity<>(slist, HttpStatus.OK);
    }

    //

    @PostMapping("/upload")
    public String uploadReview(@RequestParam("reviewTitle") String reviewTitle,
                               @RequestParam("reviewContents") String reviewContents,
                               @RequestParam("reviewScore") int reviewScore,
                               @RequestParam(value = "file", required = false) MultipartFile file,
                               @RequestParam("spotSeq") long spotSeq,
                               HttpSession session) {

        // 세션에서 로그인한 유저 seq 가져오기
        long userSeq = (long) session.getAttribute("SESSION_USER_CODE");
//
//        if (userSeq == null){
//
//        } else {
//        }

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
