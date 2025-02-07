package com.spring.pettu.hotdeal.controller;

import com.spring.pettu.hotdeal.service.HotdealServiceImpl;
import com.spring.pettu.hotdeal.vo.HistoryVO;
import com.spring.pettu.hotdeal.vo.HotdealPagingVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hotdeal")
public class HotdealController {

    private final HotdealServiceImpl hotdealService;
    private static final Logger logger = LoggerFactory.getLogger(HotdealController.class);

    @GetMapping("/home")
    public String home(Model model, HotdealPagingVO hotdealPagingVO,
                       @RequestParam(value="nowPage", required = false, defaultValue = "1") int nowPage,
                       @RequestParam(value = "cntPerPage", required = false, defaultValue = "16") int cntPerPage) {

        int total = hotdealService.getTotalHotdealCount();

        hotdealPagingVO = new HotdealPagingVO(total, nowPage, cntPerPage);
        model.addAttribute("hlist", hotdealService.getSearchHotdealRecently());
        model.addAttribute("dlist", hotdealService.getSearchDiscount());
        model.addAttribute("paging", hotdealPagingVO);
        model.addAttribute("viewAll", hotdealService.getPagedHotdeals(hotdealPagingVO));
        model.addAttribute("contentPage", "/pettu/hotdeal/hotdeal_main.jsp");
        return "pettu/layout/layout";
    }

    @GetMapping("/detail")
    public String detail(Model model, @RequestParam(value="proSeq") int proSeq) {

        model.addAttribute("hvo", hotdealService.getHotdealData(proSeq));
        model.addAttribute("htlist", hotdealService.getHistoryByProSeq(proSeq));
        model.addAttribute("contentPage", "/pettu/hotdeal/hotdeal_detail.jsp");
        return "pettu/layout/layout";
    }

    @PostMapping("/chart")
    public ResponseEntity<List<HistoryVO>> getHistoryByProSeq(@RequestParam(value="proSeq") int proSeq) {

        List<HistoryVO> hlist = hotdealService.getHistoryByProSeq(proSeq);
        return ResponseEntity.ok(hlist);
    }

    @GetMapping("/search")
    public String search(Model model, HotdealPagingVO hotdealPagingVO,
                                    @RequestParam(value="keyword") String keyword,
                                    @RequestParam(value="nowPage", required = false, defaultValue = "1") int nowPage,
                                    @RequestParam(value = "cntPerPage", required = false, defaultValue = "16") int cntPerPage)
    {
        int total = hotdealService.getCountSearchHotdeals(keyword);
        hotdealPagingVO = new HotdealPagingVO(total, nowPage, cntPerPage);
        model.addAttribute("paging", hotdealPagingVO);
        model.addAttribute("slist", hotdealService.getSearchHotdeals(hotdealPagingVO, keyword));
        model.addAttribute("keyword", keyword);
        model.addAttribute("contentPage", "/pettu/hotdeal/hotdeal_search.jsp");
        return "pettu/layout/layout";
    }



}
