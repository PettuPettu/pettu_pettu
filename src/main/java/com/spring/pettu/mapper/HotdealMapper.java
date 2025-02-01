package com.spring.pettu.mapper;

import com.spring.pettu.hotdeal.vo.HotdealVO;
import com.spring.pettu.hotdeal.vo.HistoryVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HotdealMapper {

    public void insertHotdealData(@Param("hotdeal") HotdealVO hotdeal, @Param("history") HistoryVO history);
    public List<HotdealVO> selectHotdealDataAll();
    public HotdealVO selectHotdealDataById(@Param("proSeq") int proSeq);
}
