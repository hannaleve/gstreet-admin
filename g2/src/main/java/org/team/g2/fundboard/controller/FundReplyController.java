package org.team.g2.fundboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;
import org.team.g2.fundboard.dto.FundReplyDTO;
import org.team.g2.fundboard.service.FundReplyService;

import java.util.List;

@Log4j2
@RestController //@ResponseBody걸린다.
@RequestMapping("/replies")
@RequiredArgsConstructor
public class FundReplyController {

    private final FundReplyService replyService;

    @GetMapping("")
    public String[] doA(){

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return new String[]{"AAA","BBB","CCCC"};
    }

    @GetMapping("/list/{fno}") //replies/list/128 (REST방식)
    public List<FundReplyDTO> getBoardReplies(@PathVariable(name="fno") Long fno) {

        //서비스 계층 호출
        return replyService.getRepliesWithFno(fno);

    }

    @PostMapping("")
    public int add(@RequestBody FundReplyDTO replyDTO){ //댓글 등록

        log.info("==========================");
        log.info(replyDTO);

        return replyService.add(replyDTO);

    }

    @PutMapping("/{frno}") // 댓글 수정
    public String modify( @PathVariable(name="frno")  Long frno,
                          @RequestBody FundReplyDTO replyDTO){

        log.info("-------------reply modify-------------" + frno);
        log.info(replyDTO);

        replyService.modify(replyDTO);

        return "success";
    }

    @DeleteMapping("/{frno}") // 댓글 삭제
    public String remove( @PathVariable(name="frno")  Long frno){
        log.info("----------------reply remove------------");

        log.info("rno: " + frno);

        replyService.remove(frno);

        return "success";
    }

}