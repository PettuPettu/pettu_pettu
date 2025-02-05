package com.spring.pettu.admin.controller;

import com.spring.pettu.admin.service.AdminServiceImpl;
import com.spring.pettu.admin.vo.PagingVO;
import com.spring.pettu.auth.user.vo.UserVO;
import com.spring.pettu.hotdeal.service.HotdealServiceImpl;
import com.spring.pettu.hotdeal.vo.HotdealPagingVO;
import com.spring.pettu.mapper.UserMapper;
import com.spring.pettu.mypage.service.MyPageServiceImpl;
import com.spring.pettu.myreview.service.MyReviewServiceImpl;
import com.spring.pettu.spot.service.SpotService;
import com.spring.pettu.spot.service.SpotServiceImpl;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final HotdealServiceImpl hotdealService;
    private final AdminServiceImpl adminService;
    private final MyReviewServiceImpl myReviewService;
    private final UserMapper userMapper;
    private final MyPageServiceImpl myPageService;
    private static final Logger logger = LoggerFactory.getLogger(com.spring.pettu.hotdeal.controller.HotdealController.class);

    @GetMapping("/user")
    public String adminUser(Model model, PagingVO pagingVO,
                            @RequestParam(value="nowPage", required = false, defaultValue = "1") int nowPage,
                            @RequestParam(value = "cntPerPage", required = false, defaultValue = "5") int cntPerPage) {

        int total = adminService.getCountUser();

        PagingVO userpagingVO = new PagingVO(total, nowPage, cntPerPage);

        model.addAttribute("paging", userpagingVO);
        model.addAttribute("ulist", adminService.getUserPaging(userpagingVO));
        model.addAttribute("contentPage", "/pettu/admin/admin_user.jsp");
        return "pettu/admin/admin_user";
    }

    @GetMapping("/place")
    public String adminPlace(Model model, PagingVO pagingVO,
                             @RequestParam(value="nowPage", required = false, defaultValue = "1") int nowPage,
                             @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage) {

        int total = adminService.getCountSpot();

        PagingVO placepagingVO = new PagingVO(total, nowPage, cntPerPage);

        model.addAttribute("paging", placepagingVO);
        model.addAttribute("slist", adminService.getSpotPaging(placepagingVO));
        model.addAttribute("contentPage", "/pettu/admin/admin_place.jsp");
        return "pettu/admin/admin_place";
    }

    @PostMapping("/place/delete")
    public String adminPlaceDelete(@RequestParam(value="spotSeq") long spotSeq) {
        System.out.println("hello");
        adminService.deleteSpotBySpotSeq(spotSeq);
        return "redirect:/admin/place";
    }

    @GetMapping("/hotdeal")
    public String adminHotdeal(Model model, HotdealPagingVO hotdealpagingVO,
                               @RequestParam(value="nowPage", required = false, defaultValue = "1") int nowPage,
                               @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage) {
        // 핫딜 페이징 vo 그냥 pagingvo에 합치는 것도 좋을 듯
        int total = hotdealService.getTotalHotdealCount();

        hotdealpagingVO = new HotdealPagingVO(total, nowPage, cntPerPage);

        model.addAttribute("paging", hotdealpagingVO);
        model.addAttribute("hlist", hotdealService.getPagedHotdeals(hotdealpagingVO));

        model.addAttribute("contentPage", "/pettu/admin/admin_hotdeal.jsp");
        return "pettu/admin/admin_hotdeal";
    }

    @GetMapping("/user/detail")
    public String adminUserDetail(Model model, @RequestParam("userSeq") Long userSeq) {

        //쿼리 추가해서 jsp에 던지기
        UserVO uvo = userMapper.findByUserSeq(userSeq);
        model.addAttribute("user", uvo);
        model.addAttribute("plist", myPageService.findUserAndFileById(userSeq));
        //model.addAttribute("rlist", adminService.getReviewByUserSeq(userSeq));
        model.addAttribute("urlist", myReviewService.findUserAndReviewById(userSeq));

        model.addAttribute("contentPage", "/pettu/admin/admin_user_detail.jsp");
        return "pettu/admin/admin_user_detail";
    }

    @PostMapping("/user/detail/review/delete")
    public String adminReviewDelete(@RequestParam("userSeq") Long userSeq,
                                    @RequestParam("reviewSeq") Long reviewSeq) {
        try {
            myReviewService.deleteReviewById(reviewSeq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/user/detail?userSeq=" + userSeq;
    }

    @PostMapping("/user/detail/status/update")
    public String adminUserStatusUpdate(@RequestParam("userSeq") Long userSeq){
        adminService.updateUserStatus(userSeq);
        return "redirect:/admin/user/detail?userSeq=" + userSeq;
    }

}