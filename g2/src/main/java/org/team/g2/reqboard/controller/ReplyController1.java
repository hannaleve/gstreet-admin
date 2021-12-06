package org.team.g2.reqboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.team.g2.reqboard.dto.ReplyDTO;
import org.team.g2.reqboard.service.ReplyService;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/replies1")
@RequiredArgsConstructor
public class ReplyController1 {

    private final ReplyService replyService;

    @GetMapping("/list/{bno}")
    public List<ReplyDTO> getBoardReplies1(@PathVariable(name="bno") Long bno) {
        return replyService.getReplicesWithBno1(bno);

    }

//    @PreAuthorize("isAuthenticated()")
    @PostMapping("")
    public int add1(@RequestBody ReplyDTO replyDTO){


        log.info("==========================");
        log.info(replyDTO);
        return replyService.add1(replyDTO);

    }
    @PutMapping("/{rno}")
    public String modify1( @PathVariable(name="rno")  Long rno,
                          @RequestBody ReplyDTO replyDTO){

        log.info("-------------reply modify-------------" + rno);
        log.info(replyDTO);

        replyService.modify1(replyDTO);

        return "success";
    }
    @DeleteMapping("/{rno}")
    public String remove1( @PathVariable(name="rno")  Long rno ){
        log.info("----------------reply remove------------");

        log.info("rno: " + rno);

        replyService.remove1(rno);

        return "success";
    }


}
