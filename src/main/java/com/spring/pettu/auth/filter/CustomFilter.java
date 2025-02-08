package com.spring.pettu.auth.filter;

import com.spring.pettu.auth.traffic.service.TrafficLogService;
import com.spring.pettu.auth.traffic.vo.TrafficLogVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CustomFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        if (request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            String requestURI = httpRequest.getRequestURI();

            if (requestURI.contains(".env") || requestURI.contains(".php")) {
                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "접근 권한이 없습니다.");
                return;
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
