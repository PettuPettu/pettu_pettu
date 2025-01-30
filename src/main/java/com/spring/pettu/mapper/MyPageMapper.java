package com.spring.pettu.mapper;

import com.spring.pettu.mypage.vo.FileVO;
import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.mypage.vo.UserAndFileVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MyPageMapper {

    UserAndFileVO getUserWithFileAndPets(long id);
    int saveUserProfileImage(FileVO fileVO);
    int updatePet(PetVO petVO);
    FileVO getPetByPetSeq(long petSeq);
    FileVO getPetByUserSeq(long userSeq);
    int updateUserProfileImage(FileVO fileVO);
    int updatePetImage(FileVO fileVO);
    UserAndFileVO findUserByNickName(String nickName);
    int updateNickname(@Param("userSeq") long userSeq, @Param("nickName") String nickName);
    int savePet(PetVO petVO);
    List<PetVO> selectPetsByUserSeq(long userSeq);
    int deletePet(long id);

}
