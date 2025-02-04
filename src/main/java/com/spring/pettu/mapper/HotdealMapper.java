package com.spring.pettu.mapper;

import com.spring.pettu.hotdeal.vo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import java.util.List;

public interface HotdealMapper {

    public void insertHotdealData(@Param("hotdeal") HotdealDTO hotdeal);
    public void insertHistoryData(@Param("hotdeal") HotdealDTO hotdeal, @Param("hotdealvo") HotdealVO hotdealvo);
    public List<HotdealVO> selectAllHotdealData();
    public HotdealVO selectByProductId(@Param("productId") String productId);
    public HotdealVO selectByProductSeq(@Param("proSeq") int proSeq);
    public int checkProductId(String productId);
    public int checkRegitDate(@Param("hotdealvo") HotdealVO hotdealvo);
    public void updateHistory(@Param("hotdeal") HotdealDTO hotdeal, @Param("hotdealvo") HotdealVO hotdealvo);
    public List<HotdealJoinHistoryVO> findHotdeals(@Param("hotdealPagingVO") HotdealPagingVO hotdealPagingVO);
    public List<HotdealJoinHistoryVO> selectSearch(@Param("hotdealPagingVO") HotdealPagingVO hotdealPagingVO, @Param("keyword") String keyword);
    public int countHotdeals();
    public int countSearch(@Param("keyword") String keyword);
    public List<HistoryVO> selectHistoryByProSeq(@Param("proSeq") int proSeq);
    public List<DiscountVO> selectDiscount();
    public List<HotdealJoinHistoryVO> selectProductRecently();
}
