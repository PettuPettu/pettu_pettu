package com.spring.pettu.common.exception;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
public class ErrorResponse {
    private LocalDateTime timestamp;
    private int code;
    private String message;

    @Builder
    public ErrorResponse(int code, String message) {
        this.timestamp = LocalDateTime.now();
        this.code = code;
        this.message = message;
    }

    public static ErrorResponse of(int errorCode, String message) {
        return ErrorResponse.builder()
                .code(errorCode)
                .message(message)
                .build();
    }
}
