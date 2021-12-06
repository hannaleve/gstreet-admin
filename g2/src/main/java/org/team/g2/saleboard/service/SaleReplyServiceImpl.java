package org.team.g2.saleboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team.g2.saleboard.domain.SaleReply;
import org.team.g2.saleboard.dto.SaleReplyDTO;
import org.team.g2.saleboard.mapper.SaleBoardMapper;
import org.team.g2.saleboard.mapper.SaleReplyMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class SaleReplyServiceImpl implements SaleReplyService {

    private final SaleBoardMapper saleBoardMapper;
    private final SaleReplyMapper saleReplyMapper;

    @Override
    public int add2(SaleReplyDTO saleReplyDTO) {
        int count = saleReplyMapper.insert(dtoToEntity2(saleReplyDTO));
        saleBoardMapper.updateReplyCnt(saleReplyDTO.getSno(), 1);

        return count;
    }

    @Override
    public List<SaleReplyDTO> getRepliesWithSno2(Long sno) {
        return saleReplyMapper.getListWithBoard(sno).stream()
                .map(reply -> entityToDTO(reply)).collect(Collectors.toList());
    }

    @Override
    public int remove2(Long rno) {
        SaleReply saleReply = saleReplyMapper.read(rno);
        saleBoardMapper.updateReplyCnt(saleReply.getSno(),-1);
        return saleReplyMapper.delete(rno);
    }

    @Override
    public int modify2(SaleReplyDTO saleReplyDTO) {
        return saleReplyMapper.update(dtoToEntity2(saleReplyDTO));
    }
}
