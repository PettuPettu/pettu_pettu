package com.spring.pettu.mapper;

import com.spring.pettu.mypage.vo.PetVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PetbtiMapper {
    int updatePetMbti(PetVO petVO);
}
