package com.spring.pettu.main.service;

import com.spring.pettu.main.vo.MainVO;
import com.spring.pettu.mapper.SpotMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
    private final SpotMapper spotMapper;

    @Override
    public List<Map<String, Object>>selectRecentlyOpenedSpots() {
        List<MainVO> spotList = spotMapper.getRecentlyOpenedSpots();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");

        return spotList.stream().map(spot -> {
            Map<String, Object> spotMap = new HashMap<>();
            spotMap.put("detailPath", "/review/detail/"+spot.getSpotSeq());
            spotMap.put("imagePath", spot.getSpotPicture());
            spotMap.put("category", spot.getCategoryName());
            spotMap.put("title", spot.getSpotName());
            if(spot.getSpotLocation()==null){
                spotMap.put("description", "");
            } else {
                spotMap.put("description", spot.getSpotLocation());
            }
            String price=null;
            if(spot.getSpotTotalAvgScore()<=0){
                price = "아직 리뷰가 없어요!";
            } else {
                price = "리뷰 "+spot.getSpotTotalAvgScore()+"점";
            }
            spotMap.put("price", price);
            String info = formatter.format(spot.getSpotOpenDate());
            spotMap.put("info", "개업 날짜: "+info);
            return spotMap;
        }).collect(Collectors.toList());
    }
}
