package com.spring.pettu.review.service;

import com.spring.pettu.review.vo.ReviewVO;
import com.spring.pettu.spot.vo.SpotVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ReviewService {

    SpotVO svcSpotAndReviewList(long spotSeq);

    int saveReviewWithImage(String reviewTitle, String reviewContents, int reviewScore,
                            MultipartFile file, long userSeq, long spotSeq);

    List<ReviewVO> svcReviewListWithImage(long spotSeq);
}
