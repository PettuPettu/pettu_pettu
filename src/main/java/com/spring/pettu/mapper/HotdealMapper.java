package com.spring.pettu.mapper;

import com.spring.pettu.hotdeal.vo.HotdealDTO;
import com.spring.pettu.hotdeal.vo.HotdealVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import java.util.List;

public interface HotdealMapper {

    public void insertHotdealData(@Param("hotdeal") HotdealDTO hotdeal);
    public void insertHistoryData(@Param("hotdeal") HotdealDTO hotdeal, @Param("hotdealvo") HotdealVO hotdealvo);
    public List<HotdealVO> selectAllHotdealData();
    public HotdealVO selectByProductId(@Param("productId") String productId);
    public int checkProductId(String productId);
    public int checkRegitDate(@Param("hotdealvo") HotdealVO hotdealvo);
    public void updateHistory(@Param("hotdeal") HotdealDTO hotdeal, @Param("hotdealvo") HotdealVO hotdealvo);
}
