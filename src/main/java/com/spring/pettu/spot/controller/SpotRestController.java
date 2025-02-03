package com.spring.pettu.spot.controller;


import com.spring.pettu.spot.service.SpotServiceImpl;
import com.spring.pettu.spot.vo.SearchSpotType;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
//클라이언트 -> 서버 요청 : @RequestBody
//서버 -> 클라이언트 응답 : @ResponseBody
// @RestController =  @Controller + @ResponseBody

@RestController
@RequiredArgsConstructor
@RequestMapping("/rest/spot")
public class SpotRestController {

    private final SpotServiceImpl rSvc;

    // spot top3 REST API
    @GetMapping("/top3")
    public ResponseEntity<List<SpotVO>> spotListOfTop3() {
        List<SpotVO> slist = rSvc.svcSelectSpotTop3();
        return new ResponseEntity<>(slist, HttpStatus.OK);
    }

    // spot 검색 결과 REST API
    @PostMapping("/searchSpot")
    public ResponseEntity<List<SpotVO>> spotListBySearchType(@RequestBody SearchSpotType searchSpotType) {

        List<SpotVO> slist = rSvc.svcSelectSpotListBySearchType(searchSpotType);

        return new ResponseEntity<>(slist, HttpStatus.OK);
    }


}
