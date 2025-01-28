package com.spring.pettu.review.service;

import com.spring.pettu.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.spring.pettu.review.vo.ReviewVO;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;


    @Override
    public List<ReviewVO> findALl() {
        List<ReviewVO> rlist = new ArrayList<>();
        return rlist;
    }

    @Override
    public int addTestEntity(ReviewVO reviewVO) {
        return 0;
    }
}
