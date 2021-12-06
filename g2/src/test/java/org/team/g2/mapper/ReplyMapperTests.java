package org.team.g2.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.team.g2.common.config.RootConfig;
import org.team.g2.reqboard.config.ReqRootConfig;
import org.team.g2.reqboard.domain.Reply;
import org.team.g2.reqboard.mapper.ReplyMapper;

import java.util.stream.IntStream;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration( classes = {ReqRootConfig.class, RootConfig.class} )
public class ReplyMapperTests {

    @Autowired(required = false)
    ReplyMapper replyMapper;

    @Test
    public void insertDommies() {
        long[] arr = {306L,305L,302L,300L};

        IntStream.rangeClosed(1,100).forEach(num -> {
//            long bno = arr[(int)(Math.random())*arr.length]; //0,1,2,3,4
            long bno = arr[(int)(Math.random()*1000) % 5]; //0,1,2,3,4

            Reply reply = Reply.builder()
                    .bno(bno)
                    .reply("댓글....." + num)
                    .replyer("user" + (num % 10)) //0~9까지
                    .build();

            replyMapper.insert(reply);
        });
    }

    @Test
    public void testList() {
        Long bno= 300L;

        replyMapper.getListWithReqboard(bno).forEach(reply -> log.info(reply));
    }
}
