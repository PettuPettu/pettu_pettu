package com.spring.pettu.test.controller;

import com.spring.pettu.test.vo.TestEntity;
import com.spring.pettu.test.service.TestServiceImpl;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class TestController {

    private final TestServiceImpl testService;
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);


    @GetMapping("/cccqq")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> emailCheck22() {

        Map<String, Object> map = new HashMap<>();
        map.put("message", "이메일 전송 완료");
        map.put("AuthNumber", 11+"");

        return ResponseEntity.ok(map);

    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(Model model) {

        testService.test();
        logger.info("Log = test");
        System.out.println("Log 나오네");
        System.out.println("TestController");
        model.addAttribute("TEST", "Hello Spring");
        throw new RuntimeException();
//        return "test";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<TestEntity> aLl = testService.findALl();
        model.addAttribute("aLl", aLl);
        return "list";
    }

    @GetMapping("/add")
    public String add(Model model) {
        TestEntity test = new TestEntity("id_666","pw_666", "username666");
        testService.addTestEntity(test);
        logger.info("Log = add");
        return "redirect:/list";
    }

    @GetMapping("/layout")
    public String layout(Model model) {
        model.addAttribute("contentPage", "/list");
        return "pettu/layout/layout";
    }

    @GetMapping("/")
    public String mainPage(Model model) {
        model.addAttribute("contentPage", "/pettu/main/main.jsp");


        model.addAttribute("productsSlide", Arrays.asList(
                new HashMap<String, String>() {{
                    put("category", "간식");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "[복슬 강아지] 무항생제 오리안심 육포22222");
                    put("description", "첨가물 없이 만드는 반려견 간식 (생후 4개월 이상)");
                    put("price", "600000000");
                    put("info", "7일 전보다 2,000원 저렴해요!");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "간식");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "[복슬 강아지] 무항생제 오리안심 육포");
                    put("description", "첨가물 없이 만드는 반려견 간식 (생후 4개월 이상)");
                    put("price", "6000");
                    put("info", "7일 전보다 2,000원 저렴해요!");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "간식");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "[복슬 강아지] 무항생제 오리안심 육포");
                    put("description", "첨가물 없이 만드는 반려견 간식 (생후 4개월 이상)");
                    put("price", "6000");
                    put("info", "7일 전보다 2,000원 저렴해요!");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "간식");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "[복슬 강아지] 무항생제 오리안심 육포");
                    put("description", "첨가물 없이 만드는 반려견 간식 (생후 4개월 이상)");
                    put("price", "6000");
                    put("info", "7일 전보다 2,000원 저렴해요!");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "간식");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "[복슬 강아지] 무항생제 오리안심 육포");
                    put("description", "첨가물 없이 만드는 반려견 간식 (생후 4개월 이상)");
                    put("price", "6000");
                    put("info", "7일 전보다 2,000원 저렴해요!");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "간식");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "[복슬 강아지] 무항생제 오리안심 육포");
                    put("description", "첨가물 없이 만드는 반려견 간식 (생후 4개월 이상)");
                    put("price", "6000");
                    put("info", "7일 전보다 2,000원 저렴해요!");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "간식");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "[복슬 강아지] 무항생제 오리안심 육포");
                    put("description", "첨가물 없이 만드는 반려견 간식 (생후 4개월 이상)");
                    put("price", "6000");
                    put("info", "7일 전보다 2,000원 저렴해요!");
                    put("detailPath", "/list");
                }}

        ));

        model.addAttribute("placeSlide", Arrays.asList(
                new HashMap<String, String>() {{
                    put("category", "카페");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "도그365");
                    put("description", "경기 성남시 분당구 새마을로51번길 5");
                    put("price", "리뷰 4.9점");
                    put("info", "최근 리뷰 - 사장님이 엄청 친절하고 시설이 좋아요 :)");
                    put("detailPath", "/list");

                }},
                new HashMap<String, String>() {{
                    put("category", "카페");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "도그365");
                    put("description", "경기 성남시 분당구 새마을로51번길 5");
                    put("price", "리뷰 4.9점");
                    put("info", "최근 리뷰 - 사장님이 엄청 친절하고 시설이 좋아요 :)");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "카페");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "도그365");
                    put("description", "경기 성남시 분당구 새마을로51번길 5");
                    put("price", "리뷰 4.9점");
                    put("info", "최근 리뷰 - 사장님이 엄청 친절하고 시설이 좋아요 :)");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "카페");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "도그365");
                    put("description", "경기 성남시 분당구 새마을로51번길 5");
                    put("price", "리뷰 4.9점");
                    put("info", "최근 리뷰 - 사장님이 엄청 친절하고 시설이 좋아요 :)");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "카페");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "도그365");
                    put("description", "경기 성남시 분당구 새마을로51번길 5");
                    put("price", "리뷰 4.9점");
                    put("info", "최근 리뷰 - 사장님이 엄청 친절하고 시설이 좋아요 :)");
                    put("detailPath", "/list");
                }},
                new HashMap<String, String>() {{
                    put("category", "카페");
                    put("imagePath", "/assets/layout/github.svg");
                    put("title", "도그365");
                    put("description", "경기 성남시 분당구 새마을로51번길 5");
                    put("price", "리뷰 4.9점");
                    put("info", "최근 리뷰 - 사장님이 엄청 친절하고 시설이 좋아요 :)");
                    put("detailPath", "/list");
                }}
        ));

        return "pettu/layout/layout";
    }

    @GetMapping("/modal")
    public void dynamicModal(@RequestParam("page") String page, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jspPath = page + ".jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
        dispatcher.forward(request, response);
    }

}
