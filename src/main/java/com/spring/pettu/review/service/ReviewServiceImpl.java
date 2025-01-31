package com.spring.pettu.review.service;

import com.spring.pettu.mapper.ReviewMapper;
import com.spring.pettu.mapper.SpotMapper;
import com.spring.pettu.review.vo.SearchSpotType;
import com.spring.pettu.review.vo.SpotVO;
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
    private final SpotMapper spotMapper;


    @Override
    public List<ReviewVO> findALl() {
        List<ReviewVO> rlist = new ArrayList<>();
        return rlist;
    }


    @Override
    public List<SpotVO> svcSelectAllSpot() {
        List<SpotVO> spotList = new ArrayList<>();
        spotList = spotMapper.spotList();
        return spotList;
    }

    @Override
    public List<SpotVO> svcSelectSpotTop3() {
        List<SpotVO> spotList = new ArrayList<>();
        spotList = spotMapper.spotListOfTop3();
        return spotList;
    }

    @Override
    public List<SpotVO> svcSelectSpotListBySearchType(SearchSpotType searchSpotType) {
        List<SpotVO> spotList = new ArrayList<>();
        spotList = spotMapper.spotListByType(searchSpotType);
        return spotList;
    }

    // 페이징 처리된 가게리스트 API
    @Override
    public List<SpotVO> svcSpotListByPaging(int startSeq, int endSeq) {
        List<SpotVO> spotList = new ArrayList<>();
        spotList = spotMapper.spotListByPaging(startSeq, endSeq);
        return spotList;
    }


}
