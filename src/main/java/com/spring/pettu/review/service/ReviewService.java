package com.spring.pettu.review.service;

import com.spring.pettu.review.vo.ReviewVO;
import com.spring.pettu.spot.vo.SpotVO;

import java.util.List;

public interface ReviewService {

    SpotVO svcSpotAndReviewList(long spotSeq);

}
