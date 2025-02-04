package com.spring.pettu.mapper;

import com.spring.pettu.mypage.vo.FileVO;
import com.spring.pettu.spot.vo.SpotVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.spring.pettu.review.vo.ReviewVO;

import java.util.List;

@Repository
@Mapper
public interface ReviewMapper {
    SpotVO selectAllSpotAndReviewList(long spotSeq);
    int uploadReviewImage(FileVO fileVO);

    int insertReview(ReviewVO reviewVO);

    List<ReviewVO> reviewListWithImage(long spotSeq);
}

