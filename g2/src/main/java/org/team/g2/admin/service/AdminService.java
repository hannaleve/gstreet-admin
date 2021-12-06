package org.team.g2.admin.service;

import org.team.g2.fundboard.dto.FundBoardDTO;
import org.team.g2.qnaboard.dto.QnaBoardDTO;
import org.team.g2.reqboard.dto.ReqBoardDTO;
import org.team.g2.saleboard.dto.SaleBoardDTO;

import java.util.List;

public interface AdminService {

    String getStatOne();
    String getStatTwo();

    List<String> hashSelectList();

    List<ReqBoardDTO> requestList();

    String countList();

    List<FundBoardDTO> fundboardList();

    List<SaleBoardDTO> saleboardList();

    List<QnaBoardDTO> qnaboardList();

}
