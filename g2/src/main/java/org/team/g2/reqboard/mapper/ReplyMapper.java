package org.team.g2.reqboard.mapper;

import org.team.g2.reqboard.domain.Reply;
import org.team.g2.reqboard.domain.ReqBoard;

import java.util.List;

public interface ReplyMapper {

    int insert(Reply reply);

    List<Reply> getListWithReqboard(Long bno);

    int update(Reply reply);

    int delete(Long rno);

    int update2(Reply reply);




}
