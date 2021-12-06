package org.team.g2.reqboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.team.g2.reqboard.domain.ReqLike;
import org.team.g2.reqboard.service.ReqBoardService;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/reqboard/*")
@Log4j2
@RequiredArgsConstructor
public class LikeRestController {

    private final ReqBoardService reqBoardService;

    @PostMapping ("/likeupdate")
    public @ResponseBody Map<String,String> likeupdate(@RequestBody ReqLike reqLike){
        log.info("likeupdate");

        Map<String,String> map = new HashMap<>();

        try {
            reqBoardService.likeupdate(reqLike);

            map.put("result", "success");


        }catch(Exception e) {
            e.printStackTrace();
            map.put("result", "fail");
        }

        return map;
    }
}
