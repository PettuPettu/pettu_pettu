package com.spring.pettu.admin.controller;

import com.spring.pettu.hotdeal.service.HotdealServiceImpl;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final HotdealServiceImpl hotdealService;
    private static final Logger logger = LoggerFactory.getLogger(com.spring.pettu.hotdeal.controller.HotdealController.class);

    @GetMapping("/user")
    public String adminUser(Model model) {
        model.addAttribute("contentPage", "/pettu/admin/admin_user.jsp");
        return "pettu/admin/admin_user";
    }

    @GetMapping("/place")
    public String adminPlace(Model model) {
        model.addAttribute("contentPage", "/pettu/admin/admin_place.jsp");
        return "pettu/admin/admin_place";
    }

    @GetMapping("/hotdeal")
    public String adminHotdeal(Model model) {
        model.addAttribute("contentPage", "/pettu/admin/admin_hotdeal.jsp");
        return "pettu/admin/admin_hotdeal";
    }

    @GetMapping("/user/detail")
    public String adminUserDetail(Model model) {
        model.addAttribute("contentPage", "/pettu/admin/admin_user_detail.jsp");
        return "pettu/admin/admin_user_detail";
    }

}