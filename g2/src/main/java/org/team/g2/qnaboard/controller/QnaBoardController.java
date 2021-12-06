package org.team.g2.qnaboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.g2.qnaboard.dto.QnaBoardDTO;
import org.team.g2.qnaboard.service.QnaBoardService;
import org.team.g2.qnaboard.service.QnaTimeService;

@Controller
@RequestMapping("/qnaboard")
@Log4j2
@RequiredArgsConstructor
public class QnaBoardController {

    private final QnaBoardService qnaBoardService;


    @PreAuthorize("isAuthenticated()")
    @PostMapping("/modify2")
    public String modify(QnaBoardDTO qnaBoardDTO, RedirectAttributes redirectAttributes) {
        log.info(".......c modify........." + qnaBoardDTO);
        if(qnaBoardService.modify(qnaBoardDTO)) {
            redirectAttributes.addFlashAttribute("result","modified");
        }
        redirectAttributes.addAttribute("qno",qnaBoardDTO.getQno());

        return "redirect:/qnaboard/list2";
    }
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/remove")
    public String remove(Long qno, RedirectAttributes redirectAttributes){

        log.info("Controller Remove:" + qno);

        if(qnaBoardService.remove(qno)) {
            log.info("remove success");
            redirectAttributes.addFlashAttribute("result", "success");
        }
        return "redirect:/qnaboard/list2";
    }
    @PreAuthorize("isAuthenticated()")
    @GetMapping(value = {"/modify2","/read"})
    public void read(Long qno, Model model) {
        log.info("c read" + qno);
        model.addAttribute("qnaBoardDTO", qnaBoardService.read(qno));
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/register2")
    public void registerGet() {

    }

    @PostMapping("/register2")
    public String registerPost(QnaBoardDTO qnaBoardDTO, RedirectAttributes redirectAttributes){

        log.info(".......qnaBoardDTOM     " + qnaBoardDTO);

        Long qno = qnaBoardService.register(qnaBoardDTO);

        log.info(qno);

        redirectAttributes.addFlashAttribute("result", qno);

        return "redirect:/qnaboard/list2";
    }


    @GetMapping("/list2")
    public void getList2(Model model){
        log.info("=======controller get list==========");

        model.addAttribute("dtoList", qnaBoardService.getDTOList());
    }
}
