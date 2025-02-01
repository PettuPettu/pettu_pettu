package com.spring.pettu.petbti.controller;

import com.spring.pettu.mypage.service.MyPageService;
import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.petbti.service.PetbtiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/petbti")
public class PetbtiController {

    private final MyPageService myPageService;
    private final PetbtiService petbtiService;

    @GetMapping
    public String petbtiStart(Model model) {
        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");
        model.addAttribute("petbtiContent", "/pettu/petbti/petbti_start.jsp");
        return "pettu/layout/layout";
    }

    @GetMapping("/pets")
    public String petbtiSelect(Model model, HttpSession session) {

        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");

        Long userCode = (Long) session.getAttribute("SESSION_USER_CODE");

        if (userCode == null){
            model.addAttribute("petbtiContent", "/pettu/petbti/petbti_select_guest.jsp");
        } else {
            List<PetVO> petsList = myPageService.findPetByUserSeq(userCode);
            model.addAttribute("petsList", petsList);
            model.addAttribute("petbtiContent", "/pettu/petbti/petbti_select_user.jsp");
        }

        return "pettu/layout/layout";
    }

    @GetMapping("/questions")
    public String petbtiQuestions(Model model) {
        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");
        model.addAttribute("petbtiContent", "/pettu/petbti/petbti_questions.jsp");

        return "pettu/layout/layout";
    }

    @GetMapping("/result")
    public String petbtiResult(Model model) {
        model.addAttribute("contentPage", "/pettu/petbti/petbti_layout.jsp");
        model.addAttribute("petbtiContent", "/pettu/petbti/petbti_result.jsp");

        return "pettu/layout/layout";
    }

    @PostMapping("/mbti")
    @ResponseBody
    public ResponseEntity<String> petUpdate(@RequestBody PetVO petVO) {
        try {
            petbtiService.updatePetMbti(petVO);
            return ResponseEntity.ok("MBTI 업데이트 성공");
        }catch (Exception e){
            return ResponseEntity.ok("오류가 발생했습니다");
        }
    }

}
