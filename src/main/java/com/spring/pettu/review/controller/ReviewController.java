package com.spring.pettu.review.controller;

import com.spring.pettu.review.vo.ReviewVO;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.spring.pettu.review.service.ReviewServiceImpl;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {

    private final ReviewServiceImpl reviewService;
    private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);


    /*-------------------------- jsp 페이지 mapping ---------------------------*/


    @GetMapping("/detail/{storeId}")
    public String reviewStoreDetail(@PathVariable("storeId") Long storeId, Model model) {
        SpotVO svo = reviewService.svcSpotAndReviewList(storeId);

        model.addAttribute("SPOT_ALL_INFO", svo);


        model.addAttribute("contentPage", "/pettu/review/review_store_detail.jsp");
        return "pettu/layout/layout";
    }

    @GetMapping("/createModal")
    public String reviewModal(Model model) {
        model.addAttribute("contentPage", "/pettu/review/review_create_modal.jsp");
        return "pettu/layout/layout";
    }


    /*-----------------------------------------------------------------------*/



}
