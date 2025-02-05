package com.spring.pettu.common.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<ErrorResponse> handleBusinessException(BusinessException ex) {
        ErrorResponse errorResponse = ErrorResponse.builder()
                .code(ex.getErrorCode().getStatus())
                .message(ex.getMessage())
                .build();

        log.error("MESSAGE = {}", ex.getMessage());
        log.error("CODE = {}", ex.getErrorCode().getStatus());

        return new ResponseEntity<>(errorResponse,
                HttpStatus.valueOf(ex.getErrorCode().getStatus()));
    }

    // 400 BadRequest 에러 처리
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleBadRequest(Model model) {
        model.addAttribute("errorCode", "400");
        model.addAttribute("errorMessage", "잘못된 요청입니다.");
        model.addAttribute("errorText", "잘못된 요청 입니다. 관리자에게 문의해 주세요.");
        return "pettu/error/error";
    }


    // 403 Forbidden 에러 처리
    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public String handle403(Model model) {
        model.addAttribute("errorCode", "403");
        model.addAttribute("errorMessage", "웹 페이지를 볼 수 있는 권한이 없습니다.");
        model.addAttribute("errorText", "해당 페이지를 볼 수 있는 권한이 없습니다.<br/>로그인 상태를 확인하시거나, 접근 권한이 있는지 관리자에게 문의해 주세요.");
        return "pettu/error/error";
    }

    // 404 Not Found 에러 처리
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404(Model model) {
        model.addAttribute("errorCode", "404");
        model.addAttribute("errorMessage", "페이지를 찾을 수 없습니다.");
        model.addAttribute("errorText", "페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다.<br/>입력하신 주소가 정확한지 다시 한 번 확인해주세요 :)");
        return "pettu/error/error";
    }

    // 500 Internal Server Error 에러 처리
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String handle500(Model model) {
        model.addAttribute("errorCode", "500");
        model.addAttribute("errorMessage", "서버 오류가 발생했습니다.");
        model.addAttribute("errorText", "처리 중 문제가 발생하여 요청을 완료할 수 없습니다.<br/>잠시 후 다시 시도해 주세요. 불편을 드려 죄송합니다.");
        return "pettu/error/error";
    }

    // 모든 예외 잡아내기
    // @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleException(Exception ex) {
        ErrorResponse errorResponse = ErrorResponse.builder()
                .code(HttpStatus.INTERNAL_SERVER_ERROR.value())
                .message("서버 내부 오류가 발생했습니다.")
                .build();

        return new ResponseEntity<>(errorResponse,
                HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

