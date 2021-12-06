package org.team.g2.reqboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.g2.reqboard.domain.ReqLike;
import org.team.g2.reqboard.dto.*;
import org.team.g2.reqboard.mapper.TimeMapper;
import org.team.g2.reqboard.service.ReqBoardService;



@Controller
@RequestMapping("/reqboard/*")
@Log4j2
@RequiredArgsConstructor
public class ReqBoardController {

  private final TimeMapper timeMapper;

  private final ReqBoardService reqBoardService;


  @GetMapping("/time")
  public void time(Model model) {
    log.info("board time......");
    model.addAttribute("time",timeMapper.getTime());
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/register")
  public void registerGet() {

  }

  @PostMapping("/register")
  public String registerPost(ReqBoardDTO reqBoardDTO,RedirectAttributes redirectAttributes) {
    log.info("ReqboardDTO..........." + reqBoardDTO);

    Long bno = reqBoardService.register(reqBoardDTO);

    log.info("c.....registerPost............");
    redirectAttributes.addFlashAttribute("result", bno);

    log.info("----------------------------------------------");



    return "redirect:/reqboard/list";
  }

  @GetMapping("/list")
  public void getList(PageRequestDTO pageRequestDTO, Model model) {
    log.info("c getlist..." + pageRequestDTO);


    PageResponseDTO<ReqBoardDTO> responseDTO = reqBoardService.getDTOList(pageRequestDTO);

    int total = responseDTO.getCount();

    int page = pageRequestDTO.getPage();

    int size = pageRequestDTO.getSize();

    model.addAttribute("pageMaker",new PageMaker(page,size,total));

    model.addAttribute("dtoList",responseDTO.getDtoList());
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping(value = {"/modify", "/read"})
  public void read(@RequestParam (value = "bno", required=false) Long bno, PageRequestDTO pageRequestDTO,Model model, Authentication userID)  {
    log.info("c  read" + bno);

    ReqBoardDTO reqBoardDTO = reqBoardService.read(bno);

    log.info("---------------------------------------------");
    log.info("---------------------------------------------");
    log.info("---------------------------------------------");
    log.info(reqBoardDTO);
    log.info("---------------------------------------------");
    log.info("---------------------------------------------");
    log.info("---------------------------------------------");

    model.addAttribute("reqboardDTO", reqBoardDTO);




    ReqLike reqLike = new ReqLike();
    reqLike.setBno(bno);
    reqLike.setUserID(currentUserName());


    int ltlike = reqLike.getLtlike();

    int check = reqBoardService.ltlikecount(reqLike);

    if(check==0) {
      reqBoardService.likeinsert(reqLike);
    }else if(check == 1) {
      ltlike = reqBoardService.ltlikegetinfo(reqLike);

    }
    model.addAttribute("ltlike",ltlike);
    log.info("userID  read" + bno);
    model.addAttribute("userID",reqBoardService.getUserID(bno));


  }

   public String  currentUserName() {
    Authentication authentication2 = SecurityContextHolder.getContext().getAuthentication();
    String username = authentication2.getName();
    log.warn("current username : {}", username);
    return username;
  }


  @PreAuthorize("isAuthenticated()")
@RequestMapping(value="/remove", method = RequestMethod.POST)
  public String remove(Long bno, RedirectAttributes redirectAttributes) {
    log.info("c    remove: " + bno);
    if(reqBoardService.remove(bno)) {
      log.info("remove success");
      redirectAttributes.addFlashAttribute("result","success");
    }
    return "redirect:/reqboard/list";
  }



  @PostMapping("modify")
  public String modify(ReqBoardDTO reqboardDTO,PageRequestDTO pageRequestDTO, ReqHashTagDTO reqHashTagDTO,RedirectAttributes redirectAttributes) { //리다이렉트해야하니까
    log.info("c      modify:" + reqboardDTO);


    if(reqboardDTO.getFiles().size() > 0) {
      reqboardDTO.getFiles().forEach(dto -> log.info(dto));
    }

    if(reqBoardService.modify(reqboardDTO)) {
      log.info("됩니다 곽한나"+reqboardDTO.getTags());
      redirectAttributes.addFlashAttribute("result", "modified");

    } else{

    }


    log.info("----------------------------------------------");


    redirectAttributes.addAttribute("num",reqHashTagDTO.getNum());


    redirectAttributes.addAttribute("bno",reqboardDTO.getBno());
    redirectAttributes.addAttribute("page",pageRequestDTO.getPage());
    redirectAttributes.addAttribute("size",pageRequestDTO.getSize());


    if(pageRequestDTO.getType() != null) {
      redirectAttributes.addAttribute("type",pageRequestDTO.getType());
      redirectAttributes.addAttribute("keyword",pageRequestDTO.getKeyword());
    }

    return "redirect:/reqboard/read";
  }



}
