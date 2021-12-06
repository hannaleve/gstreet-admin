package org.team.g2.fundboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.fundboard.dto.FundReplyDTO;
import org.team.g2.fundboard.mapper.FundReplyMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class FundReplyServiceImpl implements FundReplyService {

    private final FundReplyMapper replyMapper;

    @Override // 목록
    public List<FundReplyDTO> getRepliesWithFno(Long fno) {
        //Reply -> ReplyDTO 변환해서(map) list로 반환
        //댓글(db와연결된 vo entity) -> 댓글dto(객체타입)
        return replyMapper.getListWithFundBoard(fno).stream().map(freply -> entityToDTO(freply)).collect(Collectors.toList());
    }

    @Override // 등록
    public int add(FundReplyDTO replyDTO) {
        return replyMapper.insert(dtoToEntity(replyDTO)); //dto -> entity로바꿔줌
    }

    @Override // 수정
    public int modify(FundReplyDTO replyDTO) {
        return replyMapper.update(dtoToEntity(replyDTO));
    } //dto->entity로바꿔줌

    @Override
    public int remove(Long frno) {
        return replyMapper.delete(frno);
    }

}