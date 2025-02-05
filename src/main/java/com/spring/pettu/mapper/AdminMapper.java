package com.spring.pettu.mapper;

import com.spring.pettu.admin.vo.PagingVO;
import com.spring.pettu.auth.user.vo.UserVO;
import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.spot.vo.SpotVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    public List<SpotVO> selectSpotPaging(@Param("pagingVO") PagingVO pagingVO);

    public int countSpot();

    public List<UserVO> selectUserPaging(@Param("pagingVO") PagingVO pagingVO);

    public int countUser();

    public List<UserVO> selectUserAll();

    public List<PetVO> selectPetByUserSeq(@Param("userSeq") long userSeq);

    public void updateUserStatusZero(@Param("userSeq") long userSeq);

    public void updateUserStatusOne(@Param("userSeq") long userSeq);

    public int selectUserStatusByUserSeq(@Param("userSeq") long userSeq);

    public void deleteSpotById(@Param("spotSeq") long spotSeq);
}
