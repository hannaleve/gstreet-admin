package org.team.g2.reqboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.reqboard.domain.ReqBoard;
import org.team.g2.reqboard.domain.ReqHashTag;
import org.team.g2.reqboard.domain.ReqLike;
import org.team.g2.reqboard.dto.*;
import org.team.g2.reqboard.mapper.ReqBoardMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReqBoardServiceImpl implements ReqBoardService{

    private final ReqBoardMapper reqBoardMapper;


    @Override
    public Long register(ReqBoardDTO reqBoardDTO) {
        ReqBoard reqBoard = reqBoardDTO.getDomain();

        reqBoardMapper.insert(reqBoard);

        Long bno = reqBoard.getBno();

        log.info("BNO:" + bno);


        reqBoard.getAttachList().forEach(attach -> {
            attach.setBno(bno);

            reqBoardMapper.insertAttach(attach);
        });


        reqBoardDTO.getTags().forEach(str -> {


            reqBoardMapper.hashtaginsert(bno, str);
        });

        return reqBoard.getBno();
    }

    @Override
    public PageResponseDTO<ReqBoardDTO> getDTOList(PageRequestDTO pageRequestDTO) {
        List<ReqBoardDTO> dtoList =  reqBoardMapper.getList(pageRequestDTO).stream().map(board -> board.getDTO()).collect(Collectors.toList());
        int count = reqBoardMapper.getCount(pageRequestDTO);

        PageResponseDTO<ReqBoardDTO> pageResponseDTO = PageResponseDTO.<ReqBoardDTO>builder()
                .dtoList(dtoList)
                .count(count)
                .build();
        return pageResponseDTO;

    }

    @Override
    public ReqBoardDTO read(Long bno) {
        ReqBoard reqBoard = reqBoardMapper.select2(bno);

        reqBoardMapper.updateViewCount(bno);

        List<String> strings =  reqBoardMapper.selectHash(bno);

        reqBoard.setTags(strings);


        return reqBoard.getDTO();

    }

    @Override
    public void updateViewCount(Long bno){
        reqBoardMapper.updateViewCount(bno);

    }

    @Override
    public boolean remove(Long bno) {
        return reqBoardMapper.delete(bno) >0;
    }

    @Override
    public boolean modify(ReqBoardDTO reqBoardDTO) {
        ReqBoard reqBoard = reqBoardDTO.getDomain();

        Long bno = reqBoard.getBno();

        log.info("BNO:" + bno);



        reqBoardMapper.deleteAttach(reqBoard.getBno());

        reqBoard.getAttachList().forEach(attach -> {
            attach.setBno(bno);

            reqBoardMapper.insertAttach(attach);
        });


        if(reqBoardDTO.getTags() != null && reqBoardDTO.getTags().size() > 0){
            reqBoardMapper.deletehashtags(bno);
        }

        reqBoardDTO.getTags().forEach(str -> {
            log.info("modifytags----------------------------------------");
            log.info(str);

            reqBoardMapper.hashtaginsert(bno, str);

        });

        return reqBoardMapper.update(reqBoardDTO.getDomain()) >0;
    }


    @Override
    public int ltlikecount(ReqLike reqLike) {
        return reqBoardMapper.ltlikecount(reqLike);
    }

    @Override
    public int ltlikegetinfo(ReqLike reqLike) {
        return reqBoardMapper.ltlikegetinfo(reqLike);
    }

    @Override
    public void likeinsert(ReqLike reqLike) {
         reqBoardMapper.likeinsert(reqLike);
    }

    @Override
    public void likeupdate(ReqLike reqLike) {
        reqBoardMapper.likeupdate(reqLike);

    }


    @Override
    public ReqLikeDTO getUserID(Long bno) {
        ReqLike reqLike = reqBoardMapper.getUserID(bno);

        if(reqLike != null) {
            return reqLike.getDTO();
        }
        return null;
    }






}
