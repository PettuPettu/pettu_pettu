package com.spring.pettu.main.controller;

import com.spring.pettu.hotdeal.service.HotdealServiceImpl;
import com.spring.pettu.main.service.MainService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {
    private final HotdealServiceImpl hotdealService;
    private final MainService mainService;

    @GetMapping
    public String mainPage(Model model) {
        model.addAttribute("contentPage", "/pettu/main/main.jsp");
        model.addAttribute("productsSlide", hotdealService.getSearchDiscount());
        model.addAttribute("placeSlide", mainService.selectRecentlyOpenedSpots());

        return "pettu/layout/layout";
    }
}
