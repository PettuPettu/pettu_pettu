package com.spring.pettu.mypage.service;

import com.spring.pettu.common.exception.BusinessException;
import com.spring.pettu.mapper.MyPageMapper;
import com.spring.pettu.mypage.vo.FileVO;
import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.mypage.vo.UserAndFileVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import static com.spring.pettu.common.exception.ErrorCode.FILE_UPLOAD_ERROR;


@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageService {

    private final MyPageMapper myPageMapper;

    public UserAndFileVO findUserAndFileById(Long id) {
        return myPageMapper.getUserWithFileAndPets(id);
    }

    @Override
    public int saveFileImage(MultipartFile file, long userSeq, long petSeq, int type) {

        if(file == null){
            return 1;
        }
        try {

            // 저장 경로 설정
            // 맥북용 내 프로젝트 경로에 이미지 저장
//            String uploadDir = "/Users/yeongbee/SIntellij/pettu_pettu2/src/main/webapp/pettu/images";
            // 이미지 정적리소스 경로, 변경시 servlet-context.xml에서도 변경하기
            String uploadDir = "/Users/yeongbee/SIntellij/images";
            Path uploadPath = Paths.get(uploadDir);

            // 디렉토리가 없으면 생성
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // 파일 저장

            String fileName = UUID.randomUUID().toString()+System.currentTimeMillis() +"." + FilenameUtils.getExtension(file.getOriginalFilename());
            Path filePath = uploadPath.resolve(fileName);
            Files.write(filePath, file.getBytes());

            FileVO fileVo = FileVO.builder()
                    .orgName(file.getOriginalFilename())
                    .sysName(fileName)
                    .userSeq(userSeq)
                    .fileSize(file.getSize()+"")
                    .fileType(type)
                    .petSeq(petSeq)
                    .build();

           if(petSeq == 0){
               //user
               if(myPageMapper.getPetByUserSeq(userSeq) != null){
                   myPageMapper.updateUserProfileImage(fileVo);
               }
               else {
                   return  myPageMapper.saveUserProfileImage(fileVo);
               }
           } else {
               if(myPageMapper.getPetByPetSeq(petSeq) != null){
                   myPageMapper.updatePetImage(fileVo);
               } else {
                   return  myPageMapper.saveUserProfileImage(fileVo);
               }
           }
            return 1;

        } catch (IOException e) {

            throw new BusinessException(FILE_UPLOAD_ERROR);
        }
    }

    @Override
    public int updatePet(PetVO petVO) {
        return myPageMapper.updatePet(petVO);
    }

    @Override
    public UserAndFileVO findUserByNickName(String nickName) {
        return myPageMapper.findUserByNickName(nickName);
    }

    @Override
    public int updateNickname(Long id, String nickName) {
        return myPageMapper.updateNickname(id, nickName);
    }

    @Override
    public int savePet(PetVO petVO) {
        return myPageMapper.savePet(petVO);
    }

    @Override
    public List<PetVO> findPetByUserSeq(Long id) {
        return myPageMapper.selectPetsByUserSeq(id);
    }

    @Override
    public int deletePetByPetSeq(Long id) {
        return myPageMapper.deletePet(id);
    }


}
