package com.spring.pettu.review.service;

import com.spring.pettu.mapper.ReviewMapper;
import com.spring.pettu.mapper.SpotMapper;
import com.spring.pettu.spot.vo.SpotVO;
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
    public SpotVO svcSpotAndReviewList(long storeId) {
        SpotVO rlist = new SpotVO();
        rlist = reviewMapper.selectAllSpotAndReviewList(storeId);
        return rlist;
    }


}
