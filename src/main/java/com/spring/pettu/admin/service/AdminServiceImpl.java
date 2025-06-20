package com.spring.pettu.admin.service;

import com.spring.pettu.admin.vo.PagingVO;
import com.spring.pettu.admin.vo.SpotJoinCategoryVO;
import com.spring.pettu.auth.user.vo.UserVO;
import com.spring.pettu.mapper.AdminMapper;
import com.spring.pettu.mypage.vo.PetVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;

    @Override
    public List<SpotJoinCategoryVO> getSpotPaging(PagingVO pagingVO) {
        return adminMapper.selectSpotPaging(pagingVO);
    }

    @Override
    public int getCountSpot() {
        int count = adminMapper.countSpot();
        System.out.println(count);
        return count;
    }

    @Override
    public List<UserVO> getUserPaging(PagingVO pagingVO) {
        return adminMapper.selectUserPaging(pagingVO);
    }

    @Override
    public int getCountUser() {
        return adminMapper.countUser();
    }

    @Override
    public List<UserVO> getUserAll() {
        return adminMapper.selectUserAll();
    }

    @Override
    public List<PetVO> getPetByUserSeq(long userSeq) {
        return adminMapper.selectPetByUserSeq(userSeq);
    }

    @Override
    public void updateUserStatus(long userSeq) {
        if (adminMapper.selectUserStatusByUserSeq(userSeq) == 1) {
            adminMapper.updateUserStatusZero(userSeq);
        } else {
            adminMapper.updateUserStatusOne(userSeq);
        }
    }

    @Override
    public void deleteSpotBySpotSeq(long spotSeq) {
        adminMapper.deleteSpotById(spotSeq);
    }
}
