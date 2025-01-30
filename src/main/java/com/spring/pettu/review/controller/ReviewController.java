package com.spring.pettu.review.controller;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.spring.pettu.review.service.ReviewServiceImpl;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {

    private final ReviewServiceImpl reviewService;
    private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);


    /*-------------------------- jsp 페이지 mapping ---------------------------*/
    @GetMapping("/list")
    public String reviewStoreList(Model model) {
        model.addAttribute("contentPage", "/pettu/review/review_store_list.jsp");
        return "pettu/layout/layout";
    }

    @GetMapping("/detail")
    public String reviewStoreDetail(Model model) {
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
