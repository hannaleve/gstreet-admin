package org.team.g2.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.team.g2.common.config.RootConfig;
import org.team.g2.reqboard.config.ReqRootConfig;
import org.team.g2.reqboard.domain.ReqBoard;
import org.team.g2.reqboard.domain.ReqHashTag;
import org.team.g2.reqboard.dto.*;
import org.team.g2.reqboard.mapper.ReqBoardMapper;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration( classes = {ReqRootConfig.class, RootConfig.class} )
public class ReqBoardMapperTests {
    @Autowired
    ReqBoardMapper reqBoardMapper;


    @Test
    public void testDummies() {
        IntStream.rangeClosed(1,100).forEach(i -> {
            ReqBoard board = ReqBoard.builder()
                    .title("title" + i)
                    .content("content" + i)
                    .writer("user" + (i%10)) //user0~user9
                    .lat(11.11)
                    .lang(12.12)
                    .build();
            reqBoardMapper.insert(board);
        });
    }

    @Test

    public void testList() {

        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .size(10)
                .type("H")
                .keyword("펀딩")
                .build();

        log.info(pageRequestDTO);
        log.info("-------------------------------------------");
        log.info("-------------------------------------------");
        log.info("-------------------------------------------");



        List<ReqBoardDTO> boardDTOList = reqBoardMapper.getList(pageRequestDTO).stream().map(board -> board.getDTO()).collect(Collectors.toList());
        log.info("-------------------------------------------");
        log.info("-------------------------------------------");
        log.info(boardDTOList);
        log.info("===========================================");

        for (ReqBoardDTO reqBoardDTO : boardDTOList) {
            log.info(reqBoardDTO);
            log.info(reqBoardDTO.getTags());
            log.info("+++++++++++++++++++++++++++++++++++++++++++++++++");
        }

        log.info("-------------------------------------------");
        log.info("-------------------------------------------");


        int count  = reqBoardMapper.getCount(pageRequestDTO);

        //타입을 나중에 결정 E
        PageResponseDTO<ReqBoardDTO> pageResponseDTO = new PageResponseDTO<>();
        pageResponseDTO.setDtoList(boardDTOList);
        pageResponseDTO.setCount(count);


//        reqBoardMapper.getList(pageRequestDTO).forEach(reqBoard -> log.info(reqBoard));
    }



    @Test
    public void testDelete() {
        long bno = 265L;
        log.info("delete.....");
        log.info(reqBoardMapper.delete(bno));
    }

    @Test
    public void testUpdate() {
     ReqBoard reqBoard = ReqBoard.builder()
                .bno(252L)
                .title("수정해봅니다.")
             .content("내용입니당")
             .lat(11.11)
             .lang(22.22)
             .build();

             log.info(reqBoardMapper.update(reqBoard));
    }

    @Test
    public void testLike() {

        ReqLikeDTO reqLikeDTO = ReqLikeDTO.builder().build();
        log.info(reqLikeDTO);
//        reqBoardMapper.reqboardList(reqLikeDTO).forEach(reqBoard -> log.warn(reqBoard));
    }


    @Test
    public void testSelect2() {
        ReqBoard reqBoard = reqBoardMapper.select2(297L);

        log.info(reqBoard);

        reqBoard.getReqHashTags2().forEach(reqHashTag -> log.info(reqHashTag));
    }



//    @Test
//    public void testUpdateHash(){
//        ReqHashTag reqHashTag = ReqHashTag.builder()
//                .gubun("R")
//                .num(316L) //316게시물
//                .tags("왜안돼")
//                .build();
//
//        reqBoardMapper.updatehashtags(); //1나오면 성공
//    }


    }


