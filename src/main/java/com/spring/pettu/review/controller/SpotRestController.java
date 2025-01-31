package com.spring.pettu.review.controller;

import com.spring.pettu.review.service.ReviewServiceImpl;
import com.spring.pettu.review.vo.SearchSpotType;
import com.spring.pettu.review.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
//클라이언트 -> 서버 요청 : @RequestBody
//서버 -> 클라이언트 응답 : @ResponseBody
// @RestController =  @Controller + @ResponseBody

@RestController
@RequiredArgsConstructor
@RequestMapping("/spot")
public class SpotRestController {

    private final ReviewServiceImpl rSvc;


    // spot top3 REST API
    @GetMapping("/top3")
    public ResponseEntity<List<SpotVO>> spotListOfTop3() {
        System.out.println( "SpotRestController : spotListOfTop3 함수 실행 >> ");
        List<SpotVO> slist = rSvc.svcSelectSpotTop3();
        return new ResponseEntity<>(slist, HttpStatus.OK);
    }

    // spot 검색 결과 REST API
    @GetMapping("/searchSpot")
    public ResponseEntity<List<SpotVO>> spotListBySearchType(@RequestBody SearchSpotType searchSpotType) {
        System.out.println( "SpotRestController : spotListBySearchType 함수 실행 >> ");

        System.out.println("검색어 >>> "+searchSpotType.toString());

        List<SpotVO> slist = rSvc.svcSelectSpotListBySearchType(searchSpotType);

        return new ResponseEntity<>(slist, HttpStatus.OK);
    }

}
