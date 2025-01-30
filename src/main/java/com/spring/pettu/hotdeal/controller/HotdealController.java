package com.spring.pettu.hotdeal.controller;

import com.spring.pettu.hotdeal.service.HotdealServiceImpl;
import com.spring.pettu.review.controller.ReviewController;
import com.spring.pettu.review.service.ReviewServiceImpl;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hotdeal")
public class HotdealController {

    private final HotdealServiceImpl hotdealService;
    private static final Logger logger = LoggerFactory.getLogger(HotdealController.class);

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("contentPage", "/pettu/hotdeal/hotdeal_main.jsp");
        return "pettu/hotdeal/hotdeal_main";
    }

    @GetMapping("/detail")
    public String detail(Model model) {
        model.addAttribute("contentPage", "/pettu/hotdeal/hotdeal_detail.jsp");
        return "pettu/hotdeal/hotdeal_detail";
    }
}
