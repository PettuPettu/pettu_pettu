package com.spring.pettu.myreview.service;

import com.spring.pettu.common.exception.BusinessException;
import com.spring.pettu.common.exception.ErrorCode;
import com.spring.pettu.mapper.MyReviewMapper;
import com.spring.pettu.myreview.vo.MyReviewReviewVO;
import com.spring.pettu.myreview.vo.UserAndReviewVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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


    //원래 정렬은 DB에서 끝내고 와야 하지만 너무 귀찮아서.....
    @Override
    public UserAndReviewVO sort(String sortStr, long userSeq) {

        UserAndReviewVO user = myReviewMapper.getUserAndReviews(userSeq);
        try {
            if (user.getReviewReviewVOList() != null) {
                List<MyReviewReviewVO> sortedList = user.getReviewReviewVOList();

                switch(sortStr) {
                    case "oldest":
                        // 등록순 (오래된 날짜가 먼저)
                        sortedList.sort((a, b) -> a.getReviewCreateDate().compareTo(b.getReviewCreateDate()));
                        break;
                    case "rating":
                        // 평점순 (높은 평점이 먼저)
                        sortedList.sort((a, b) -> b.getReviewScore() - a.getReviewScore());
                        break;
                }
                user.setReviewReviewVOList(sortedList);
            }

            return user;
        } catch (Exception e) {
            throw new BusinessException(ErrorCode.SORTING_ERROR);
        }
    }


}
