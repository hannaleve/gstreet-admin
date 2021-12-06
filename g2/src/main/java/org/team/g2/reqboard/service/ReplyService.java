package org.team.g2.reqboard.service;

import org.team.g2.reqboard.domain.Reply;
import org.team.g2.reqboard.dto.ReplyDTO;
import org.team.g2.reqboard.dto.ReqBoardDTO;
import org.team.g2.reqboard.dto.ReqHashTagDTO;

import java.util.List;

public interface ReplyService {

    List<ReplyDTO> getReplicesWithBno1(Long bno);

    default ReplyDTO entityToDTO1(Reply reply) {
        ReplyDTO replyDTO = ReplyDTO.builder()
                .rno(reply.getRno())
                .bno(reply.getBno())
                .reply(reply.getReply())
                .replyer(reply.getReplyer())
                .replyDate(reply.getReplyDate())
                .modDate(reply.getModDate())
                .group_id(reply.getGroup_id())
                .build();

        return replyDTO;
    }


    default Reply dtoToEntity1(ReplyDTO replyDTO) {
        Reply reply = Reply.builder()
                .rno(replyDTO.getRno())
                .bno(replyDTO.getBno())
                .reply(replyDTO.getReply())
                .replyer(replyDTO.getReplyer())
                .replyDate(replyDTO.getReplyDate())
                .modDate(replyDTO.getModDate())
                .group_id(replyDTO.getGroup_id())
                .build();
        return reply;
    }


    int add1(ReplyDTO replyDTO);

    int modify1(ReplyDTO replyDTO);

    int remove1(Long rno);





}
