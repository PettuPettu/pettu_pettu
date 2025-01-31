package com.spring.pettu.myreview.service;

import com.spring.pettu.mapper.MyReviewMapper;
import com.spring.pettu.myreview.vo.UserAndReviewVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MyReviewServiceImpl implements MyReviewService {

    private final MyReviewMapper myReviewMapper;

    @Override
    public UserAndReviewVO findUserAndReviewById(Long id) {
        return myReviewMapper.getUserAndReviews(id);
    }

    @Override
    public int deleteReviewById(Long id) {
        return myReviewMapper.deleteReview(id);
    }
}
