package com.spring.pettu.myreview.controller;

import com.spring.pettu.myreview.service.MyReviewService;
import com.spring.pettu.myreview.vo.MyReviewReviewVO;
import com.spring.pettu.myreview.vo.UserAndReviewVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MyReviewController {

    private final MyReviewService myReviewService;

    @GetMapping("/myreview")
    public String myReview(Model model) {
        UserAndReviewVO reviewById = myReviewService.findUserAndReviewById(2L);
        double averageScore = 0.0;
        if (reviewById.getReviewReviewVOList() != null && !reviewById.getReviewReviewVOList().isEmpty()) {
            averageScore = reviewById.getReviewReviewVOList().stream()
                    .mapToInt(MyReviewReviewVO::getReviewScore)
                    .average()
                    .orElse(0.0);
        }
        model.addAttribute("averageScore", averageScore);
        model.addAttribute("reviewList", reviewById);
        return "pettu/user/my_review";
    }


    @DeleteMapping("/myreview/api/delete/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteReview(@PathVariable("id") Long id) {


        try {

            myReviewService.deleteReviewById(id);

            UserAndReviewVO updatedReviews = myReviewService.findUserAndReviewById(2L);

            double averageScore = 0.0;
            if (updatedReviews.getReviewReviewVOList() != null && !updatedReviews.getReviewReviewVOList().isEmpty()) {
                averageScore = updatedReviews.getReviewReviewVOList().stream()
                        .mapToInt(MyReviewReviewVO::getReviewScore)
                        .average()
                        .orElse(0.0);
            }

            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("data", updatedReviews);
            response.put("averageScore", averageScore);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("삭제가 안됨");
        }
    }

    @GetMapping("/myreview/sort")
    @ResponseBody
    public ResponseEntity<?> sortReviews(@RequestParam String sortBy, @RequestParam Long userSeq) {

        UserAndReviewVO reviews = myReviewService.findUserAndReviewById(userSeq);

        //원래 정렬은 DB에서 끝내고 와야 하지만 너무 귀찮아서.....
        try {

            if (reviews.getReviewReviewVOList() != null) {
                List<MyReviewReviewVO> sortedList = reviews.getReviewReviewVOList();

                switch(sortBy) {
                    case "oldest":
                        // 등록순 (오래된 날짜가 먼저)
                        sortedList.sort((a, b) -> a.getReviewCreateDate().compareTo(b.getReviewCreateDate()));
                        break;
                    case "rating":
                        // 평점순 (높은 평점이 먼저)
                        sortedList.sort((a, b) -> b.getReviewScore() - a.getReviewScore());
                        break;
                }
                reviews.setReviewReviewVOList(sortedList);
            }

            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("정렬 실패");
        }
    }



}
