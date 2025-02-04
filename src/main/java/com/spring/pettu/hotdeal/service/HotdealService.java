package com.spring.pettu.hotdeal.service;

import com.spring.pettu.hotdeal.vo.*;

import java.util.List;
import java.util.Map;

public interface HotdealService {
    public void hotdeal();

    List<HotdealJoinHistoryVO> getPagedHotdeals(HotdealPagingVO hotdealPagingVO);
    int getTotalHotdealCount();

    List<HotdealJoinHistoryVO> getSearchHotdeals(HotdealPagingVO hotdealPagingVO, String search);
    int getCountSearchHotdeals(String search);

    HotdealVO getHotdealData(int proSeq);

    List<HistoryVO> getHistoryByProSeq(int proSeq);

    public List<Map<String, Object>> getSearchDiscount();

    public List<Map<String, Object>> getSearchHotdealRecently();
}

