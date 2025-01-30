package com.spring.pettu.review.controller;

import com.spring.pettu.review.service.ReviewServiceImpl;
import com.spring.pettu.review.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class SpotController {

    private static final Logger logger = LoggerFactory.getLogger(SpotController.class);
    private final ReviewServiceImpl rSvc;

    @GetMapping("/list")
    public String reviewStoreList(Model model) {

        System.out.println( "SpotController : reviewStoreList 함수 실행 >> ");
        List<SpotVO> slist = rSvc.svcSelectAllSpot();
        model.addAttribute("ALL_SPOT_LIST", slist);
        model.addAttribute("contentPage", "/pettu/review/review_store_list.jsp");
        return "pettu/layout/layout";
    }

    //
   /* @GetMapping("/selectAllSpot")
    public ResponseEntity<List<SpotVO>> selectAllSpotList() {
        System.out.println( "SpotController : selectAllSpotList 함수 실행 >> ");
        List<SpotVO> slist = rSvc.svcSelectAllSpot();
        return new ResponseEntity<>(slist, HttpStatus.OK);
    }*/

}
