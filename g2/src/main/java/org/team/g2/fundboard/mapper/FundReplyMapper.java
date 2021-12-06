package org.team.g2.fundboard.mapper;

import org.team.g2.fundboard.domain.FundReply;
import org.team.g2.fundboard.dto.FundReplyDTO;

import java.util.List;

public interface FundReplyMapper {
        int insert(FundReply fundReply); //등록
        int update(FundReply reply); //수정
        int delete(Long rno); //삭제
        List<FundReply> getListWithFundBoard(Long fno); //게시물번호에 해당하는 댓글목록
}
