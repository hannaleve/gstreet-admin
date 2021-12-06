package org.team.g2.fundboard.service;

import org.springframework.transaction.annotation.Transactional;
import org.team.g2.fundboard.dto.FundBoardDTO;
import org.team.g2.fundboard.dto.PageRequestDTO;
import org.team.g2.fundboard.dto.PageResponseDTO;


@Transactional
public interface FundBoardService {
    Long register(FundBoardDTO fundBoardDTO);
    PageResponseDTO<FundBoardDTO> getDTOList(PageRequestDTO pageRequestDTO);
    PageResponseDTO<FundBoardDTO> getEndList(PageRequestDTO pageRequestDTO);
    FundBoardDTO read(long fno);
    boolean modify(FundBoardDTO fundBoardDTO);
    void updateFundCnt(FundBoardDTO fundBoardDTO);
    boolean remove(long fno);
}
