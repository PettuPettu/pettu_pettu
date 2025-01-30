package com.spring.pettu.common.exception;

import lombok.Getter;

@Getter
public enum ErrorCode {

    TEST_EXCEPTION(400, "테스트 예외 입니다"),
    MEMBER_NOT_FOUND(404, "회원을 찾을 수 없습니다."),
    DUPLICATE_EMAIL(400, "이미 존재하는 이메일입니다."),
    INVALID_INPUT(400,  "잘못된 입력값입니다."),
    FILE_UPLOAD_ERROR(400,  "파일 업로드중 오류가 발생했습니다.");


    private int status;
    private String message;

    ErrorCode(int status, String message) {
        this.status = status;
        this.message = message;
    }
}
