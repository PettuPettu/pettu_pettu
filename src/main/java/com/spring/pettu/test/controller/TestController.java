package com.spring.pettu.test.controller;

import com.spring.pettu.test.vo.TestEntity;
import com.spring.pettu.test.service.TestServiceImpl;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
