//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.spring.pettu.auth.interceptor;

import com.spring.pettu.auth.traffic.service.TrafficLogService;
import com.spring.pettu.auth.traffic.vo.TrafficLogVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



@Slf4j
@RequiredArgsConstructor
public class TrafficInterceptor extends HandlerInterceptorAdapter {


    @Autowired
    TrafficLogService trafficLogService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String ip = request.getRemoteAddr();
        log.info("IP = {}, Url  = {}", ip, request.getRequestURI());

        try {
            if(!ip.equals("0:0:0:0:0:0:0:1") && !ip.equals("127.0.0.1")){
                TrafficLogVO trafficLogVO = new TrafficLogVO();
                trafficLogVO.setClientIp(request.getRemoteAddr());
                trafficLogVO.setUserAgent(request.getHeader("User-Agent"));
                trafficLogVO.setRequestUri(request.getRequestURI());
                trafficLogService.save(trafficLogVO);
            }

        } catch (Exception e) {
            log.error("Traffic logging failed: " + e.getMessage(), e);
        }

        return true;

    }
}
