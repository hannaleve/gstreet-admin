package org.team.g2.saleboard.mapper;

import org.apache.ibatis.annotations.Param;
import org.team.g2.saleboard.domain.SaleBoard;
import org.team.g2.saleboard.dto.PageRequestDTO;


import java.util.List;

public interface  SaleBoardMapper {

    void insert(SaleBoard saleBoard);

    List<SaleBoard> getList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    void updateViewCount(Long sno);

    void insertSelectKey(SaleBoard saleBoard);

    SaleBoard read(Long sno);

    int delete (Long sno);

    int update (SaleBoard saleBoard);

    int updateReplyCnt(@Param("sno") Long sno, @Param("num") int num);

    Long prevNum(Long sno);
    Long nextNum(Long sno);

}
