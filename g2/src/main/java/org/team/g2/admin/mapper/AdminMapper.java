package org.team.g2.admin.mapper;

import org.apache.ibatis.annotations.Param;
import org.team.g2.fundboard.domain.FundBoard;
import org.team.g2.qnaboard.domain.QnaBoard;
import org.team.g2.reqboard.domain.ReqBoard;
import org.team.g2.saleboard.domain.SaleBoard;

import java.util.List;

public interface AdminMapper {

    String getStat();
    String getStat2();

    List<String> hashList();

    List<ReqBoard> request();

    String countList();

    List<FundBoard> fundboardList();

    List<SaleBoard> saleboardList();

    List<QnaBoard> qnaboardList();
}
