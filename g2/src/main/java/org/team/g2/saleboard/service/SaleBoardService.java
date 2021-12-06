package org.team.g2.saleboard.service;


import org.team.g2.saleboard.dto.PageResponseDTO;
import org.team.g2.saleboard.dto.SaleBoardDTO;

public interface SaleBoardService {

    Long register(SaleBoardDTO saleBoardDTO);

    //List<SaleBoardDTO> getDTOList(PageRequestDTO pageRequestDTO);
    PageResponseDTO<SaleBoardDTO> getDTOList(org.team.g2.saleboard.dto.PageRequestDTO pageRequestDTO);

    SaleBoardDTO read(Long sno);

    boolean remove(Long sno);

    boolean modify(SaleBoardDTO saleBoardDTO);

    Long prevNum(Long sno);
    Long nextNum(Long sno);
}
