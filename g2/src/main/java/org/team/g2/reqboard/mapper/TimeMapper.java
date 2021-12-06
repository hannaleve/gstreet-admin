package org.team.g2.reqboard.mapper;


import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

    @Select("select now()")
    String getTime();


}
