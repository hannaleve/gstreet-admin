package org.team.g2.saleboard.mapper;

import org.apache.ibatis.annotations.Select;

public interface SaleTimeMapper {

    @Select("select now()")
    String getTime();

    String getTime2();
}
