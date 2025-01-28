package com.spring.pettu.auth.user.service.impl;

import com.spring.pettu.auth.user.service.interfaces.UserEmailService;
import com.spring.pettu.common.exception.BusinessException;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;

import static com.spring.pettu.common.exception.ErrorCode.DUPLICATE_EMAIL;

@Service
@RequiredArgsConstructor
public class UserEmailServiceImpl implements UserEmailService {


    private final JavaMailSender mailSender;

    public int sendAuthEmail(String toEmail) {
        Random r = new Random();
        int authNumber = r.nextInt(888888) + 111111;

        String setFrom = "mailyeongb@gmail.com";
        String title = "펫뚜펫뚜 인증코드 입니다";
        StringBuilder sb = new StringBuilder();
        sb.append("안녕하세요 ").append(toEmail).append("님\n");
        sb.append("인증번호는 ").append(authNumber).append(" 입니다.");

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "utf-8");
            msgHelper.setFrom(setFrom);
            msgHelper.setTo(toEmail);
            msgHelper.setSubject(title);
            msgHelper.setText(sb.toString());
            mailSender.send(msg);

            return authNumber;
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new BusinessException(DUPLICATE_EMAIL);
        }
    }
}
