package com.spring.pettu.mapper;

import com.spring.pettu.myreview.vo.UserAndReviewVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MyReviewMapper {
    UserAndReviewVO getUserAndReviews(long seq);
    int deleteReview(long seq);
}
