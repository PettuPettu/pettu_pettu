package com.spring.pettu.review.service;

import com.spring.pettu.review.vo.ReviewVO;

import java.util.List;

public interface ReviewService {

    List<ReviewVO> findALl();
    int addTestEntity(ReviewVO reviewVO);
}
