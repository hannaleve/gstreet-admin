package org.team.g2.saleboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.saleboard.domain.SaleBoard;
import org.team.g2.saleboard.dto.PageRequestDTO;
import org.team.g2.saleboard.dto.PageResponseDTO;
import org.team.g2.saleboard.dto.SaleBoardDTO;
import org.team.g2.saleboard.mapper.SaleBoardMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class SaleBoardServiceImpl implements SaleBoardService {

    private final SaleBoardMapper saleBoardMapper; //주입 자동으로

    @Override
    public Long register(SaleBoardDTO saleBoardDTO) {

        SaleBoard saleBoard = saleBoardDTO.getDomain(); //domain으로 바꿔주는것

        saleBoardMapper.insert(saleBoard);

        Long sno = saleBoard.getSno();

        return saleBoard.getSno();
    }

    @Override
    public PageResponseDTO<SaleBoardDTO> getDTOList(PageRequestDTO pageRequestDTO) {
        List<SaleBoardDTO> dtoList = saleBoardMapper.getList(pageRequestDTO).stream().map(saleBoard -> saleBoard.getDTO()).collect(Collectors.toList());
        int count = saleBoardMapper.getCount(pageRequestDTO);

        PageResponseDTO<SaleBoardDTO> pageResponseDTO = PageResponseDTO.<SaleBoardDTO>builder()
                .dtoList(dtoList)
                .count(count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public SaleBoardDTO read(Long sno) {
        saleBoardMapper.updateViewCount(sno);
        SaleBoard saleBoard = saleBoardMapper.read(sno);
        return saleBoard.getDTO();
    }

    @Override
    public boolean remove(Long sno) {

        return saleBoardMapper.delete(sno) > 0;
    }

    @Override
    public boolean modify(SaleBoardDTO saleBoardDTO) {

        SaleBoard saleBoard = saleBoardDTO.getDomain();

        return saleBoardMapper.update(saleBoard) > 0;
    }

    @Override
    public Long prevNum(Long sno) {
        return saleBoardMapper.prevNum(sno);
    }

    @Override
    public Long nextNum(Long sno) {
        return saleBoardMapper.nextNum(sno);
    }


}
