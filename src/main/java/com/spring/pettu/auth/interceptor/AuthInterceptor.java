package com.spring.pettu.auth.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");



        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession();
        String loginSession = String.valueOf(session.getAttribute("SESSION_USER_CODE"));

        // 로그인 체크
        if(loginSession == null || "null".equals(loginSession)) {
            response.sendRedirect("/login?redirectURL=" + requestURI);
            return false;
        }


        // admin 권한 체크
        if (requestURI.startsWith("/admin")) {
            String role = (String) session.getAttribute("SESSION_USER_ROLE");
            if (!"ROLE_ADMIN".equals(role)) {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('권한이 없습니다.');");
                out.println("location.href='/';");
                out.println("</script>");
                out.flush();
                return false;
            }
        }

        return true;
    }
}

