package org.team.g2.fundboard.service;

import org.team.g2.fundboard.domain.FundReply;
import org.team.g2.fundboard.dto.FundReplyDTO;

import java.util.List;

public interface FundReplyService {

    List<FundReplyDTO> getRepliesWithFno(Long fno); //게시물에 해당하는 댓글목록
    int add(FundReplyDTO fundReplyDTO); //등록
    int modify(FundReplyDTO replyDTO); //수정
    int remove(Long frno); //삭제

    //인터페이스는 원래 메소드를 가질 수 없지만 default를 쓰면 실제로 몸체를 가지는 메서드를 가질 수 있다.
    default FundReplyDTO entityToDTO(FundReply reply) {
        FundReplyDTO replyDTO = FundReplyDTO.builder()
                .frno(reply.getFrno())
                .fno(reply.getFno())
                .freply(reply.getFreply())
                .freplyer(reply.getFreplyer())
                .freplydate(reply.getFreplyDate())
                .fmoddate(reply.getFmodDate())
                .build();

        return replyDTO;
    }

    //dto -> entity로바꿔줌
    default FundReply dtoToEntity(FundReplyDTO replyDTO) {
        FundReply reply = FundReply.builder()
                .frno(replyDTO.getFrno())
                .fno(replyDTO.getFno())
                .freply(replyDTO.getFreply())
                .freplyer(replyDTO.getFreplyer())
                .freplyDate(replyDTO.getFreplydate())
                .fmodDate(replyDTO.getFmoddate())
                .build();
        return reply;
    }
}