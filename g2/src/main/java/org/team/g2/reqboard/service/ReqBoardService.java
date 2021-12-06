package org.team.g2.reqboard.service;

import org.springframework.transaction.annotation.Transactional;
import org.team.g2.reqboard.domain.ReqLike;
import org.team.g2.reqboard.dto.*;

@Transactional
public interface ReqBoardService {
    Long register(ReqBoardDTO reqBoardDTO);
    PageResponseDTO<ReqBoardDTO> getDTOList(PageRequestDTO pageRequestDTO);
    ReqBoardDTO read(Long bno);
    void updateViewCount(Long bno);
    boolean remove(Long bno);
    boolean modify(ReqBoardDTO reqBoardDTO);


    int ltlikecount(ReqLike reqLike);

    int ltlikegetinfo(ReqLike reqLike);

    void likeinsert(ReqLike reqLike);

    void likeupdate(ReqLike reqLike);

    ReqLikeDTO getUserID(Long bno);





}
