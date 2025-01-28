package com.spring.pettu.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.spring.pettu.review.vo.ReviewVO;

import java.util.List;

@Repository
@Mapper
public interface ReviewMapper {
    List<ReviewVO> reviewList();
}

