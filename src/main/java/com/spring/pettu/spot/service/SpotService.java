package com.spring.pettu.spot.service;

import com.spring.pettu.spot.vo.SearchSpotType;
import com.spring.pettu.spot.vo.SpotVO;

import java.util.List;

public interface SpotService {


    List<SpotVO> svcSelectAllSpot();

    List<SpotVO> svcSelectSpotTop3();

    List<SpotVO> svcSelectSpotListBySearchType(SearchSpotType searchSpotType);

    List<SpotVO> svcSpotListByPaging(int startSeq, int endSeq);
}
