package com.spring.pettu.hotdeal.service;

import com.spring.pettu.hotdeal.vo.*;
import com.spring.pettu.mapper.HotdealMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class HotdealServiceImpl implements HotdealService {

    private final HotdealMapper hotdealMapper;

    @Override
    public void hotdeal() {
        System.out.println("hotdeal");
    }

    @Override
    public List<HotdealJoinHistoryVO> getPagedHotdeals(HotdealPagingVO hotdealPagingVO) {
        return hotdealMapper.findHotdeals(hotdealPagingVO);
    }

    @Override
    public int getTotalHotdealCount() {
        int count = hotdealMapper.countHotdeals();
        System.out.println(count);
        return count;
    }

    @Override
    public List<HotdealJoinHistoryVO> getSearchHotdeals(HotdealPagingVO hotdealPagingVO, String search) {
        List<HotdealJoinHistoryVO> slist = hotdealMapper.selectSearch(hotdealPagingVO, search);
        return slist;
    }

    @Override
    public int getCountSearchHotdeals(String search) {
        int count = hotdealMapper.countSearch(search);
        System.out.println(count);
        return count;
    }

    @Override
    public HotdealVO getHotdealData(int proSeq) {
        HotdealVO hvo = hotdealMapper.selectByProductSeq(proSeq);
        return hvo;
    }

    @Override
    public List<HistoryVO> getHistoryByProSeq(int proSeq) {
        return hotdealMapper.selectHistoryByProSeq(proSeq);
    }

    @Override
    public List<Map<String, Object>> getSearchDiscount() {

        List<DiscountVO> dlist = hotdealMapper.selectDiscount();
        List<Map<String, Object>> hashList = dlist.stream().map(product -> {
            Map<String, Object> map = new HashMap<>();
            map.put("category", product.getCategory3());
            map.put("price", product.getRecentPrice() + "원");
            map.put("info", "할인율:" + product.getDiscountRate() + "%");
            map.put("description", product.getBrand());
            map.put("title", product.getTitle());
            map.put("imagePath", product.getImage());
            return map;
        }).collect(Collectors.toList());

        return hashList;
    }

    @Override
    public List<Map<String, Object>> getSearchHotdealRecently() {
        List<HotdealJoinHistoryVO> rlist = hotdealMapper.selectProductRecently();
        List<Map<String, Object>> hashList = rlist.stream().map(product -> {
            Map<String, Object> map = new HashMap<>();
            map.put("category", product.getCategory3());
            map.put("price", product.getLowPrice() + "원");
            map.put("info", " ");
            map.put("description", product.getBrand());
            map.put("title", product.getTitle());
            map.put("imagePath", product.getImage());
            return map;
        }).collect(Collectors.toList());

        return hashList;
    }
}
