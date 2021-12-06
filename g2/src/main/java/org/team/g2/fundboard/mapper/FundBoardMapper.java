package org.team.g2.fundboard.mapper;

import org.apache.ibatis.annotations.Param;
import org.team.g2.fundboard.domain.FundBoard;
import org.team.g2.fundboard.domain.FundBoardAttach;
import org.team.g2.fundboard.dto.PageRequestDTO;

import java.util.List;

public interface FundBoardMapper {
    void insert(FundBoard fundBoard);
    List<FundBoard> getList(PageRequestDTO pageRequestDTO);
    List<FundBoard> getEndList(PageRequestDTO pageRequestDTO);
    int getCount(PageRequestDTO pageRequestDTO);
    FundBoard select(long fno);
    int update(FundBoard fundBoard);
    void updateFundCnt(long fno);
    int delete(long fno);
    // hashtags
    void insertHashtag(@Param("num") Long num, @Param("tags") String tags);
    List<String> selectHash(@Param("num") Long num); //해시태그조회
    int deleteHashtag(@Param("num") Long num); //해시태그삭제
//    List<String> selectHash(@Param("num") Long num);
}
