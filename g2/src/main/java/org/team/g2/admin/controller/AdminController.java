package org.team.g2.admin.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.team.g2.admin.service.AdminService;
import org.team.g2.reqboard.dto.ReqHashTagDTO;

import java.util.List;


@Controller
@RequestMapping("/admin/*")
@Log4j2
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/main")
    public void getStat(Model model){
        log.info("getStat.....");
        model.addAttribute("stat",adminService.getStatOne());
        model.addAttribute("stat2",adminService.getStatTwo());


        log.info("getHash......");
        model.addAttribute("hashList",adminService.hashSelectList());

        log.info("request List...");
        model.addAttribute("requestList",adminService.requestList());

        model.addAttribute("countList",adminService.countList());

        model.addAttribute("fundList",adminService.fundboardList());

        model.addAttribute("saleList",adminService.saleboardList());

        model.addAttribute("qnaList",adminService.qnaboardList());
    }



}
