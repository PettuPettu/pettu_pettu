package com.spring.pettu.myreview.service;

import com.spring.pettu.myreview.vo.UserAndReviewVO;

public interface MyReviewService {

    UserAndReviewVO findUserAndReviewById(Long id);
    int deleteReviewById(Long id);
}
