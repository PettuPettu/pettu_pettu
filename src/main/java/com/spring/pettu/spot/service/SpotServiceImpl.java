package com.spring.pettu.spot.service;

import com.spring.pettu.mapper.SpotMapper;
import com.spring.pettu.spot.vo.SearchSpotType;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class SpotServiceImpl implements SpotService {

    private final SpotMapper spotMapper;



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
        spotList = spotMapper.spotListBySearchType(searchSpotType);
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
