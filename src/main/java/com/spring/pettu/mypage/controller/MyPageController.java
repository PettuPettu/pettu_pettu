package com.spring.pettu.mypage.controller;

import com.spring.pettu.auth.user.service.interfaces.UserService;
import com.spring.pettu.mypage.service.MyPageService;
import com.spring.pettu.mypage.vo.PetVO;
import com.spring.pettu.mypage.vo.UserAndFileVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MyPageController {


    private final MyPageService myPageService;

    //마이페이지
    @GetMapping("/mypage")
    public String myPage(Model model, HttpSession session) {

        // 로그인한 유저 세션으로 꺼내서 불러오기
        // 임시 세션
        session.setAttribute("SESSION_USER_CODE", 2L);

        long userCode = (long) session.getAttribute("SESSION_USER_CODE");
        UserAndFileVO userAndFileVO = myPageService.findUserAndFileById(userCode);

        model.addAttribute("userAndFileVO", userAndFileVO);
        return "pettu/user/my_page";
    }


    // 유저 프로필 사진 변경
    @PostMapping("/mypage/user/file/upload/{id}")
    @ResponseBody
    public ResponseEntity<?> profileUpload(@RequestParam("file") MultipartFile file, @PathVariable("id") long seq) {

        long ck = 2;
        if(myPageService.saveFileImage(file, seq, 0,1) == 1){
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().build();
    }



    // 반려동물 이미지 업로드
    @PostMapping("/mypage/user/nickname/{id}")
    @ResponseBody
    public ResponseEntity<?> petUpload( @PathVariable("id") long seq, @RequestParam("nickname") String nickname) {

        log.info("seq = {}", seq);
        log.info("nickname = {}", nickname);
        UserAndFileVO findUserByNickName = myPageService.findUserByNickName(nickname);
        log.info("uSerBYNickName = {}", findUserByNickName);
        if(findUserByNickName != null){
            return ResponseEntity.status(HttpStatus.CONFLICT).body("duplicate");
        }
        myPageService.updateNickname(seq, nickname);
        return ResponseEntity.ok().build();
    }



    // 반려동물 내용 업데이트
    @PostMapping("/mypage/pet/update/{id}")
    @ResponseBody
    public ResponseEntity<?> petUpdate(@PathVariable("id") long seq,
                                       @RequestPart(value = "petData") PetVO petVO,
                                       @RequestPart(value = "image", required = false) MultipartFile file) {
            if(myPageService.saveFileImage(file, seq, petVO.getPetSeq(),2) == 1 && myPageService.updatePet(petVO) == 1){
                return ResponseEntity.ok().build();
            }
        return ResponseEntity.badRequest().build();
    }




    @GetMapping("/mypage/pet/list/{userSeq}")
    @ResponseBody
    public List<PetVO> getPetList(@PathVariable("userSeq") long userSeq) {
        return myPageService.findPetByUserSeq(userSeq);
    }



    @PostMapping("/mypage/pet/save")
    @ResponseBody
    public ResponseEntity<String> createPet(@RequestBody PetVO petVO) {
        try {
            myPageService.savePet(petVO);
            return ResponseEntity.ok("success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail");
        }
    }
    @DeleteMapping("/mypage/pet/delete/{id}")
    @ResponseBody
    public ResponseEntity<String> deletePet(@PathVariable("id") long seq) {

        log.info("seq------------ = {}", seq);
        myPageService.deletePetByPetSeq(seq);
        return ResponseEntity.ok("success");
    }


}




