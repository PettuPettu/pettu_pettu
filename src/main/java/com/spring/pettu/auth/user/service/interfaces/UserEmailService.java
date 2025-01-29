package com.spring.pettu.auth.user.service.interfaces;

public interface UserEmailService extends UserService{
    int sendAuthEmail(String toEmail);
}
