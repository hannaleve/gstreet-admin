package org.team.g2.qnaboard.mapper;

import org.apache.ibatis.annotations.Select;

public interface QnaTimeMapper {

    @Select("select now()")
    String getTime1();

    String getTime3();
}
