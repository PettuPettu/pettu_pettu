package com.spring.pettu.auth.interceptor;

import com.spring.pettu.auth.traffic.service.TrafficLogService;
import com.spring.pettu.auth.traffic.vo.TrafficLogVO;
import com.spring.pettu.mapper.TrafficMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
public class TrafficInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    TrafficLogService trafficLogService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        try {
            TrafficLogVO trafficLogVO = new TrafficLogVO();
            trafficLogVO.setClientIp(request.getRemoteAddr());
            trafficLogVO.setUserAgent(request.getHeader("User-Agent"));
            trafficLogVO.setRequestUri((String)request.getRequestURI());
            trafficLogService.save(trafficLogVO);
        } catch (Exception e) {
            log.error("Traffic logging failed: " + e.getMessage(), e);
        }
        return true;
    }
}
