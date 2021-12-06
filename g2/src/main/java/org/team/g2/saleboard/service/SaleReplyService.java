package org.team.g2.saleboard.service;

import org.team.g2.saleboard.domain.SaleReply;
import org.team.g2.saleboard.dto.SaleReplyDTO;

import java.util.List;

public interface SaleReplyService {

    int add2(SaleReplyDTO saleReplyDTO);

    int modify2(SaleReplyDTO saleReplyDTO);

    int remove2(Long rno);

    List<SaleReplyDTO> getRepliesWithSno2(Long sno);

    default SaleReply dtoToEntity2(SaleReplyDTO saleReplyDTO) {
        SaleReply saleReply = SaleReply.builder()
                .rno(saleReplyDTO.getRno())
                .sno(saleReplyDTO.getSno())
                .replier(saleReplyDTO.getReplier())
                .reply(saleReplyDTO.getReply())
                .replyDate(saleReplyDTO.getReplyDate())
                .modDate(saleReplyDTO.getModDate())
                .build();
        return saleReply;
    }

    default SaleReplyDTO entityToDTO(SaleReply saleReply) {

        SaleReplyDTO saleReplyDTO = SaleReplyDTO.builder()
                .rno(saleReply.getRno())
                .sno(saleReply.getSno())
                .reply(saleReply.getReply())
                .replier(saleReply.getReplier())
                .replyDate(saleReply.getReplyDate())
                .modDate(saleReply.getModDate())
                .build();

        return saleReplyDTO;


    }
}

