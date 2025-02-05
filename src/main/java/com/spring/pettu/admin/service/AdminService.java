package com.spring.pettu.admin.service;

import com.spring.pettu.admin.vo.PagingVO;
import com.spring.pettu.auth.user.vo.UserVO;
import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.spot.vo.SpotVO;

import java.util.List;

public interface AdminService {

    public List<SpotVO> getSpotPaging(PagingVO pagingVO);
    public int getCountSpot();
    public List<UserVO> getUserPaging(PagingVO pagingVO);
    public int getCountUser();
    public List<UserVO> getUserAll();
    public List<PetVO> getPetByUserSeq(long userSeq);
    public void updateUserStatus(long userSeq);
    public void deleteSpotBySpotSeq(long spotSeq);
}
