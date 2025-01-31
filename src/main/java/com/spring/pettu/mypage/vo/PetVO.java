package com.spring.pettu.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetVO {

    private long petSeq;
    private String petName;
    private Date petBirth;
    private String petMbti;
    private int petGender;
    private int petKing;
    private long userSeq;
    private String petType;
    private String petDetailType;
    private Date petCreateat;
    private Date petUpdateat;

    private FileVO fileVO;
}
