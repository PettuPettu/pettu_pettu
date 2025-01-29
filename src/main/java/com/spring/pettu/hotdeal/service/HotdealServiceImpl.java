package com.spring.pettu.hotdeal.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class HotdealServiceImpl implements HotdealService {


    @Override
    public void hotdeal() {
        System.out.println("hotdeal");
    }
}
