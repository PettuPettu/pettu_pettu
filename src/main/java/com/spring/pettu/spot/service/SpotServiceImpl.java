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

    @Override
    // SpotVO 리스트를 받아서 DB에 삽입
    public int saveSpotList(List<SpotVO> spotList) {
        System.out.println("saveSpotList >>>");

        int result = 0;

        // 리스트의 각 SpotVO 객체에 대해 insert 쿼리를 호출
        for (SpotVO spot : spotList) {
            System.out.println("저장 : >>> "+spot.getSpotName());
            result += spotMapper.insertSpot(spot);  // 삽입 결과를 누적
        }

        return result;  // 삽입된 데이터의 개수 반환
    }

}
