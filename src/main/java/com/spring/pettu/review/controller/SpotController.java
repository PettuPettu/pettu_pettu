package com.spring.pettu.review.controller;

import com.spring.pettu.common.paging.PagingUtil;
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
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/spot")
public class SpotController {

    private static final Logger logger = LoggerFactory.getLogger(SpotController.class);
    private final ReviewServiceImpl rSvc;

    @GetMapping("/list")
    public String reviewStoreList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage ) {

        System.out.println( "SpotController : reviewStoreList 함수 실행 >> ");

        // 전체 시설 목록 가져오기
        List<SpotVO> slist = rSvc.svcSelectAllSpot();
        model.addAttribute("ALL_SPOT_LIST", slist);


        // ---------------------------------- 페이징 처리 로직 ---------------------------------------
        // 전체 시설목록의 갯수
        int totRecord = slist.size();
        System.out.println("list 총 갯수 >>> "+totRecord);
        int blockCount = 9;
        int blockPage = 2; // 3 or 5 으로 변경 해야함

        PagingUtil pg = new PagingUtil("/spot/list", currentPage, totRecord, blockCount, blockPage);

        System.out.println( " pg.getPagingHtml().toString() >> "+pg.getPagingHtml().toString());
        model.addAttribute("SPOT_PAGING_BUTTON", pg.getPagingHtml().toString());
        // ---------------------------------------------------------------------------------------
        List<SpotVO> pagingSpotlist = rSvc.svcSpotListByPaging(pg.getStartSeq(),pg.getEndSeq());
        model.addAttribute("PAGING_SPOT_LIST", pagingSpotlist);


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
