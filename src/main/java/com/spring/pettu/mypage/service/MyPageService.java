package com.spring.pettu.mypage.service;

import com.spring.pettu.mypage.vo.FileVO;
import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.mypage.vo.UserAndFileVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MyPageService {

    UserAndFileVO findUserAndFileById(Long id);
    int saveFileImage(MultipartFile file, long userSeq,long petSeq,  int type);
    int updatePet(PetVO petVO);
    UserAndFileVO findUserByNickName(String nickName);
    int updateNickname(Long id, String nickName);
    int savePet(PetVO vo);
    List<PetVO> findPetByUserSeq(Long id);
    int deletePetByPetSeq(Long id);
}
