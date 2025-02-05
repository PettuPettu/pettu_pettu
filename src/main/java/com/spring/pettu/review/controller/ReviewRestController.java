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


        List<ReviewVO> slist = rSvc.svcReviewListWithImage(spotId);


        return new ResponseEntity<>(slist, HttpStatus.OK);
    }


    @PostMapping("/upload")
    public ResponseEntity<String> uploadReview(@RequestParam("reviewTitle") String reviewTitle,
                               @RequestParam("reviewContents") String reviewContents,
                               @RequestParam("reviewScore") int reviewScore,
                               @RequestParam(value = "file", required = false) MultipartFile file,
                               @RequestParam("spotSeq") long spotSeq,
                               HttpSession session) {


        long userSeq = (long) session.getAttribute("SESSION_USER_CODE");


        try {

            int reviewSeq = rSvc.saveReviewWithImage(reviewTitle, reviewContents, reviewScore, file, userSeq, spotSeq);
            if (reviewSeq > 0) {
                return new ResponseEntity<>("리뷰 업로드 성공!", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("리뷰 업로드 실패", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("업로드 중 오류가 발생했습니다: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}
