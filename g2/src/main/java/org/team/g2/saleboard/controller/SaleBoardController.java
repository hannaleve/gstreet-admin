package org.team.g2.saleboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.g2.saleboard.dto.PageMaker;
import org.team.g2.saleboard.dto.PageRequestDTO;
import org.team.g2.saleboard.dto.PageResponseDTO;
import org.team.g2.saleboard.dto.SaleBoardDTO;
import org.team.g2.saleboard.service.SaleBoardService;
import org.team.g2.saleboard.service.SaleTimeService;


@Controller
@RequestMapping("/saleboard/*")
@Log4j2
@RequiredArgsConstructor
public class SaleBoardController {

  private final SaleBoardService saleBoardService;

  @PreAuthorize("isAuthenticated()")
  @PostMapping("/modify")
  public String modify(SaleBoardDTO saleBoardDTO, PageRequestDTO pageRequestDTO,  RedirectAttributes redirectAttributes){
    log.info("modify:" + saleBoardDTO);

    if(saleBoardService.modify(saleBoardDTO)){
      redirectAttributes.addFlashAttribute("result", "modified");
    }
    redirectAttributes.addAttribute("sno",saleBoardDTO.getSno());
    redirectAttributes.addAttribute("page",pageRequestDTO.getPage());
    redirectAttributes.addAttribute("size",pageRequestDTO.getSize());

    if(pageRequestDTO.getType() != null){
      redirectAttributes.addAttribute("type",pageRequestDTO.getType());
      redirectAttributes.addAttribute("keyword",pageRequestDTO.getKeyword());
    }

    return "redirect:/saleboard/read";
  }

  @PreAuthorize("isAuthenticated()")
  @PostMapping("/remove")
  public String remove(Long sno, RedirectAttributes redirectAttributes){

    log.info("Controller Remove:" + sno);

    if(saleBoardService.remove(sno)) {
      log.info("remove success");
      redirectAttributes.addFlashAttribute("result", "success");
    }
    return "redirect:/saleboard/list";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping(value = {"/read","/modify"})
  public void read(Long sno, PageRequestDTO pageRequestDTO, Model model) {
    log.info("c read" + sno);
    log.info("c read " + pageRequestDTO);
    model.addAttribute("saleBoardDTO", saleBoardService.read(sno));
    model.addAttribute("prevNum", saleBoardService.prevNum(sno));
    model.addAttribute("nextNum", saleBoardService.nextNum(sno));
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/register")
  public void registerGet() {

  }


  @PostMapping("/register")
  public String registerPost(SaleBoardDTO saleBoardDTO, RedirectAttributes redirectAttributes) {

    log.info("SaleboardDTO..........." + saleBoardDTO);

    Long sno = saleBoardService.register(saleBoardDTO);

    log.info(sno);

    redirectAttributes.addFlashAttribute("result", sno);

    return "redirect:/saleboard/list";
  }

  @GetMapping("/list")
  public void getList(PageRequestDTO pageRequestDTO, Model model) { //파라미터로 페이지 사이즈 던지기
    log.info("getList from Controller..........." + pageRequestDTO);

    log.info(saleBoardService);

    PageResponseDTO<SaleBoardDTO> responseDTO = saleBoardService.getDTOList(pageRequestDTO);

    model.addAttribute("dtoList", responseDTO.getDtoList()); //model에 responseDTO안에있는 목록을 끄집어내서 담는다. -> 화면에서는 원래 화면을 유지하고 싶기 때문에
    //pageMaker담아 줘야 한다 (이미 그 안에 total이 들어있기 때문에 -> 그리고 pageMaker자체가 다 Getter로 설정 되어있다 즉 pageMaker가 있으면 그 안에 있는걸 다 꺼낼수 있다)

    int total = responseDTO.getCount();
    int page = pageRequestDTO.getPage();
    int size = pageRequestDTO.getSize(); //이거 세개 있으면 pageMaker만들어 줄 수 있다.

    model.addAttribute("pageMaker", new PageMaker(page,size,total));
  }


}
