package org.team.g2.reqboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team.g2.reqboard.domain.Reply;
import org.team.g2.reqboard.dto.ReplyDTO;
import org.team.g2.reqboard.mapper.ReplyMapper;
import org.team.g2.reqboard.mapper.ReqBoardMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class ReplyServiceImpl implements ReplyService{

    private final ReplyMapper replyMapper;
    private final ReqBoardMapper reqBoardMapper;

    @Override
    public List<ReplyDTO> getReplicesWithBno1(Long bno) {
        return replyMapper.getListWithReqboard(bno).stream().map(reply -> entityToDTO1(reply)).collect(Collectors.toList());
    }

    @Override
    public int add1(ReplyDTO replyDTO) {

        Reply reply = dtoToEntity1(replyDTO);
        if(replyDTO.getGroup_id() == 0) {
            int count = replyMapper.insert(reply);
            Long rno = reply.getRno();
            replyMapper.update2(reply);
            reqBoardMapper.updateReplyCnt(replyDTO.getBno(), 1);
            return count;
        } else {
            int count = replyMapper.insert(dtoToEntity1(replyDTO));
            reqBoardMapper.updateReplyCnt(replyDTO.getBno(), 1);
            return count;
        }

    }

    @Override
    public int modify1(ReplyDTO replyDTO) {//댓글수정
        return replyMapper.update(dtoToEntity1(replyDTO));
    }

    @Override
    public int remove1(Long rno) {//댓글삭제
        return replyMapper.delete(rno);
    }



}
