package com.spring.pettu.petbti.service;

import com.spring.pettu.mapper.PetbtiMapper;
import com.spring.pettu.mypage.vo.PetVO;
import org.springframework.stereotype.Service;

@Service
public class PetbtiServiceImpl implements PetbtiService {
    private final PetbtiMapper petbtiMapper;

    public PetbtiServiceImpl(PetbtiMapper petbtiMapper) {
        this.petbtiMapper = petbtiMapper;
    }

    public int updatePetMbti(PetVO petVO) {
        return petbtiMapper.updatePetMbti(petVO);
    };
}
