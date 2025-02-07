package com.spring.pettu.auth.traffic;

import com.spring.pettu.auth.traffic.service.TrafficLogService;
import com.spring.pettu.auth.traffic.vo.BanIpVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class BanIpController {

    private final TrafficLogService trafficLogService;

    @GetMapping("/ip")
    public String ipManagement(Model model) {
        List<BanIpVO> banIpList = trafficLogService.findBanIpList();
        model.addAttribute("banIpList", banIpList);
        model.addAttribute("ResultPbti", trafficLogService.getResultPbti());
        model.addAttribute("DataCount", trafficLogService.findDateCount());
        return "pettu/user/ban_list";
    }

    @PostMapping("/ip")
    public String banIp(@RequestParam String clientIp) {
        this.trafficLogService.saveBanIp(clientIp);
        return "redirect:/admin/ip";
    }

    @GetMapping("/ip/delete")
    public String deleteIp(@RequestParam String clientIp) {
        this.trafficLogService.deleteBanIp(clientIp);
        return "redirect:/admin/ip";
    }

}
