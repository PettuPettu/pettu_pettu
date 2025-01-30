package com.spring.pettu.review.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/spot")
public class SpotRestController {


    //@ResponseBody
    /*
    public ResponseEntity<List<BoardVO>> restBlist(@ModelAttribute RestVO rvo) {
        System.out.println(rvo.getUid() + "," + rvo.getUpw());

        List<BoardVO> blist = svc.svcSelect();
        return new ResponseEntity<>(blist, HttpStatus.OK);
    }
    */

    @GetMapping("/top3")
    @ResponseBody
    public String spotListOfTop3(Model model) {
        model.addAttribute("contentPage", "/pettu/review/review_store_list.jsp");
        return "pettu/layout/layout";
    }

}
