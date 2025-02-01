package com.spring.pettu.mapper;

import com.spring.pettu.review.vo.ReviewVO;
import com.spring.pettu.review.vo.SearchSpotType;
import com.spring.pettu.review.vo.SpotVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SpotMapper {

    // 등록된 전체 Spot 리스트
    List<SpotVO> spotList();

    // 리뷰 Total 수가 가장 많은 top 3 인 Spot 리스트
    List<SpotVO> spotListOfTop3();

    // 검색 결과 [ 위치(도시군) / 카테고리(시설 종류) / 가게 이름 ]에 따른 Spot 리스트
    List<SpotVO> spotListBySearchType(SearchSpotType searchSpotType);

    // 전체 Spot 리스트 수
    int spotListSize();

    // 페이징 처리된 페이지별 Spot 리스트
    List<SpotVO> spotListByPaging(@Param("startSeq") int startSeq, @Param("endSeq") int endSeq);
}

