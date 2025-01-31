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

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MyReviewController {

    private final MyReviewService myReviewService;

    @GetMapping("/myreview")
    public String myReview(Model model, HttpSession session) {

        long userCode = (long) session.getAttribute("SESSION_USER_CODE");
        UserAndReviewVO reviewById = myReviewService.findUserAndReviewById(userCode);

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
        return ResponseEntity.ok(myReviewService.sort(sortBy, userSeq));
    }

}
