package org.team.g2.reqboard.mapper;

import org.apache.ibatis.annotations.Param;
import org.team.g2.reqboard.domain.ReqBoardAttach;
import org.team.g2.reqboard.domain.ReqBoard;
import org.team.g2.reqboard.domain.ReqHashTag;
import org.team.g2.reqboard.domain.ReqLike;
import org.team.g2.reqboard.dto.PageRequestDTO;

import java.util.List;

public interface ReqBoardMapper {
    void insert(ReqBoard reqBoard);
    List<ReqBoard> getList(PageRequestDTO pageRequestDTO);
    int getCount(PageRequestDTO pageRequestDTO);

    ReqBoard select2(Long bno);
    int updateViewCount(Long bno);

    int delete(Long bno);
    int update(ReqBoard reqBoard);

    int updateReplyCnt(@Param("bno") Long bno, @Param("num") int num);

     int ltlikecount(ReqLike reqLike);

    int ltlikegetinfo(ReqLike reqLike);

    void likeinsert(ReqLike reqLike);

    int likeupdate(ReqLike reqLike);

    ReqLike getUserID(Long bno);


    void hashtaginsert(@Param("num") Long num, @Param("tags") String tags);

    List<String> selectHash(@Param("num") Long num);

    int deletehashtags(@Param("num") Long num);


    int insertAttach(ReqBoardAttach attach);

    int deleteAttach(Long bno);





}
