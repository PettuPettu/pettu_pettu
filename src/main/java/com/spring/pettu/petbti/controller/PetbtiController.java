package com.spring.pettu.petbti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class PetbtiController {
    @GetMapping("/petbti")
    public String petbtiStart(Model model) {
        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");
        model.addAttribute("petbtiContent", "/pettu/petbti/petbti_start.jsp");
        return "pettu/layout/layout";
    }

    @GetMapping("/petbti/pets")
    public String petbtiSelect(Model model, HttpSession session) {

        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");

//        if (session.getAttribute("SESSION_USER_CODE") == null){
            model.addAttribute("petbtiContent", "/pettu/petbti/petbti_select_guest.jsp");
//        } else {
//            model.addAttribute("petbtiContent", "/pettu/petbti/petbti_select_user.jsp");
//        }

        return "pettu/layout/layout";
    }

    @GetMapping("/petbti/questions")
    public String petbtiQuestions(Model model) {
        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");
        model.addAttribute("petbtiContent", "/pettu/petbti/petbti_questions.jsp");

        return "pettu/layout/layout";
    }

    @GetMapping("/petbti/result")
    public String petbtiResult(Model model) {
        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");
        model.addAttribute("petbtiContent", "/pettu/petbti/petbti_result.jsp");

        return "pettu/layout/layout";
    }
}
