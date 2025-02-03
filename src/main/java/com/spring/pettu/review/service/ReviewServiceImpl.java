package com.spring.pettu.review.service;

import com.spring.pettu.common.exception.BusinessException;
import com.spring.pettu.mapper.ReviewMapper;
import com.spring.pettu.mapper.SpotMapper;
import com.spring.pettu.mypage.vo.FileVO;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.spring.pettu.review.vo.ReviewVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static com.spring.pettu.common.exception.ErrorCode.FILE_UPLOAD_ERROR;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;


    @Override
    public SpotVO svcSpotAndReviewList(long storeId) {
        SpotVO rlist = new SpotVO();
        rlist = reviewMapper.selectAllSpotAndReviewList(storeId);
        return rlist;
    }

    // Properties의 자신의 저장경로
    @Value("${static.images.java.location}")
    private String uploadDir;


    @Override
    public int saveReviewWithImage(String reviewTitle, String reviewContents, int reviewScore,
                                   MultipartFile file, long userSeq, long spotSeq) {

        System.out.println("saveReviewWithImage >>>");
        userSeq = 2;
        spotSeq = 1;

        // 리뷰 정보를 먼저 DB에 저장
        ReviewVO reviewVO = new ReviewVO();
        reviewVO.setReviewTitle(reviewTitle);
        reviewVO.setReviewContents(reviewContents);
        reviewVO.setReviewScore((double) reviewScore);
        reviewVO.setUserSeq(userSeq);
        reviewVO.setSpotSeq(spotSeq);

        // 리뷰 DB에 저장
        int reviewSeq = reviewMapper.insertReview(reviewVO);

        // 파일이 null이면 리뷰만 저장하고 종료
        if (file == null || file.isEmpty()) {
            return reviewSeq; // 리뷰 정보만 저장
        }

        // 파일 처리
        try {
            // 파일 저장 경로 설정
            Path uploadPath = Paths.get(uploadDir);

            // 디렉토리가 존재하지 않으면 생성
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // 파일 이름 생성 (UUID + 현재 시간 + 파일 확장자)
            String fileName = UUID.randomUUID().toString() + System.currentTimeMillis() + "." +
                    FilenameUtils.getExtension(file.getOriginalFilename());

            // 파일 저장 경로
            Path filePath = uploadPath.resolve(fileName);

            // 파일 저장
            Files.write(filePath, file.getBytes());

            // 파일 메타데이터 생성
            FileVO fileVo = FileVO.builder()
                    .orgName(file.getOriginalFilename())  // 원본 파일 이름
                    .sysName(fileName)                    // 시스템에 저장될 파일 이름
                    .userSeq(userSeq)                     // 사용자 시퀀스
                    .fileSize(file.getSize() + "")        // 파일 크기
                    .fileType(3)                          // 파일 타입 (예: 1로 설정)
                    .reviewSeq(reviewSeq)                 // 리뷰 시퀀스
                    .build();

            // 파일 메타데이터 DB에 저장
            int fileUploadResult = reviewMapper.uploadReviewImage(fileVo);

            return fileUploadResult > 0 ? reviewSeq : 0; // 성공적으로 저장되면 리뷰 시퀀스 반환, 실패하면 0 반환
        } catch (IOException e) {
            throw new BusinessException(FILE_UPLOAD_ERROR);  // 예외 처리
        }
    }


}
