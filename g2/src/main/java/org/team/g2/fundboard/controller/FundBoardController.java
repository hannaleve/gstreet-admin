package org.team.g2.fundboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.g2.fundboard.dto.*;
import org.team.g2.fundboard.service.FundBoardService;


@Controller
@RequestMapping("/fundboard/*")
@Log4j2
@RequiredArgsConstructor
public class FundBoardController {

  private final FundBoardService fundBoardService;

  @GetMapping("/sample")

  public void sample() {

  }


  @GetMapping(value = {"/read", "/modify"})
  public void read(@RequestParam (value = "fno", required=false) Long fno, PageRequestDTO pageRequestDTO, Model model) {
    log.info("c   read " + fno);
    log.info("c   read " + pageRequestDTO);

    FundBoardDTO fundBoardDTO = fundBoardService.read(fno);

    log.info("한나야 취직하자"+fundBoardDTO);

    model.addAttribute("boardDTO", fundBoardDTO);
  }

  @GetMapping("/register")
  public void registerGet() {

  }


  @PostMapping("/register")
  public String registerPost(FundBoardDTO fundBoardDTO, RedirectAttributes redirectAttributes) {
    log.info("FundboardDTO..........." + fundBoardDTO);

    Long fno = fundBoardService.register(fundBoardDTO);

    redirectAttributes.addFlashAttribute("result", fno);

    return "redirect:/fundboard/list";
  }


  @GetMapping("/list")
  public void getList(PageRequestDTO pageRequestDTO, Model model) {
    log.info("c getlist...");

    log.info("======================================");
    log.info(fundBoardService);
    log.info(fundBoardService.getClass().getName());
    log.info("======================================");

    PageResponseDTO<FundBoardDTO> responseDTO = fundBoardService.getDTOList(pageRequestDTO);

    model.addAttribute("dtoList", responseDTO.getDtoList());

    log.info("호출시 담기는 값"+responseDTO.getDtoList());

    responseDTO = fundBoardService.getEndList(pageRequestDTO);

    model.addAttribute("endList", responseDTO.getEndList());

    int total = responseDTO.getCount();
    int page = pageRequestDTO.getPage();
    int size = pageRequestDTO.getSize();

    model.addAttribute("pageMaker", new PageMaker1(page,size,total));
  }

  @PostMapping("/modify")
  public String modify(FundBoardDTO fundBoardDTO, HashtagDTO hashtagDTO, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes){
    log.info("--------------------------------");
    log.info(fundBoardDTO+"컨트롤러는 타나?");
    log.info("--------------------------------");

    if(fundBoardService.modify(fundBoardDTO)){
        redirectAttributes.addFlashAttribute("result","modified");
      }

      redirectAttributes.addAttribute("num", hashtagDTO.getNum());

      redirectAttributes.addAttribute("fno", fundBoardDTO.getFno());
      redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
      redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

    if(pageRequestDTO.getType() != null){
        redirectAttributes.addAttribute("type", pageRequestDTO.getType());
        redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
    }

    return "redirect:/fundboard/read?fno="+fundBoardDTO.getFno();
  }


  @PostMapping("/remove")
  public String remove(long fno, RedirectAttributes redirectAttributes){

    log.info("fundBoardController   remove: " + fno);

    if(fundBoardService.remove(fno)){
      log.info("remove success");
      redirectAttributes.addFlashAttribute("result", "success");
    }

    return "redirect:/fundboard/list";
  }

}
