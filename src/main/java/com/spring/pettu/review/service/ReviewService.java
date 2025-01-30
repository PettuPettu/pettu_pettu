package com.spring.pettu.review.service;

import com.spring.pettu.review.vo.ReviewVO;
import com.spring.pettu.review.vo.SearchSpotType;
import com.spring.pettu.review.vo.SpotVO;

import java.util.List;

public interface ReviewService {

    List<ReviewVO> findALl();

    List<SpotVO> selectAllSpot();

    List<SpotVO> selectSpotListOfTop3();

    List<SpotVO> selectSpotListBySearchType(SearchSpotType searchSpotType);

}
