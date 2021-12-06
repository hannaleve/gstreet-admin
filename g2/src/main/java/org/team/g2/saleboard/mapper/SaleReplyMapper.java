package org.team.g2.saleboard.mapper;

import org.team.g2.saleboard.domain.SaleReply;

import java.util.List;

public interface SaleReplyMapper {

    int insert(SaleReply saleReply);

    SaleReply read(Long rno);

    List<SaleReply> getListWithBoard(Long sno);

    int delete(Long rno);

    int update(SaleReply saleReply);
    
}
