package org.team.g2.admin.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.admin.mapper.AdminMapper;
import org.team.g2.fundboard.dto.FundBoardDTO;
import org.team.g2.qnaboard.dto.QnaBoardDTO;
import org.team.g2.reqboard.dto.ReqBoardDTO;
import org.team.g2.saleboard.dto.SaleBoardDTO;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class AdminServiceImpl implements AdminService{

    private final AdminMapper adminMapper;

    @Override
    public String getStatOne() {
        return adminMapper.getStat();
    }

    @Override
    public String getStatTwo() {
        return adminMapper.getStat2();
    }

    @Override
    public List<String> hashSelectList() {

        return adminMapper.hashList();
    }

    @Override
    public List<ReqBoardDTO> requestList() {
        return adminMapper.request().stream().map(board -> board.getDTO()).collect(Collectors.toList());

    }

    @Override
    public String countList() {
        return adminMapper.countList();
    }

    @Override
    public List<FundBoardDTO> fundboardList() {
        return adminMapper.fundboardList().stream().map(fundBoard -> fundBoard.getDTO()).collect(Collectors.toList());
    }

    @Override
    public List<SaleBoardDTO> saleboardList() {
        return adminMapper.saleboardList().stream().map(saleBoard -> saleBoard.getDTO()).collect(Collectors.toList());
    }

    @Override
    public List<QnaBoardDTO> qnaboardList() {
        return adminMapper.qnaboardList().stream().map(qnaBoard -> qnaBoard.getDTO()).collect(Collectors.toList());
    }


}

