package org.team.g2.saleboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;
import org.team.g2.saleboard.dto.SaleReplyDTO;
import org.team.g2.saleboard.service.SaleReplyService;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/replies2")
@RequiredArgsConstructor
public class SaleReplyController2 {

    private final SaleReplyService saleReplyService;


    @GetMapping("")
    public String[] doA(){
        return new String[]{"AAA","BBB","CCC"};
    }


    @PostMapping("")
    public int add2(@RequestBody SaleReplyDTO saleReplyDTO){

        log.info("==========================");
        log.info(saleReplyDTO);

        return saleReplyService.add2(saleReplyDTO);
    }


    @DeleteMapping("/{rno}")
    public String remove2( @PathVariable(name="rno")  Long rno ){
        log.info("----------------reply remove------------");

        log.info("rno: " + rno);

        saleReplyService.remove2(rno);

        return "success";
    }

    @PutMapping("/{rno}")
    public String modify2( @PathVariable(name="rno")  Long rno,
                          @RequestBody SaleReplyDTO saleReplyDTO){

        log.info("-------------reply modify-------------" + rno);
        log.info(saleReplyDTO);

        saleReplyService.modify2(saleReplyDTO);

        return "success";
    }
    @GetMapping("/list/{sno}") // replies/list/230
    public List<SaleReplyDTO> getListWithBoard2(@PathVariable(name="sno") Long sno){
        //서비스 계층 호출
        return saleReplyService.getRepliesWithSno2(sno);
    }

}
