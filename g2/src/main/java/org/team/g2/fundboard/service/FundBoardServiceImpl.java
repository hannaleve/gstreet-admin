package org.team.g2.fundboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.fundboard.domain.FundBoard;
import org.team.g2.fundboard.domain.FundBoardHashtag;
import org.team.g2.fundboard.dto.FundBoardDTO;
import org.team.g2.fundboard.dto.PageRequestDTO;
import org.team.g2.fundboard.dto.PageResponseDTO;
import org.team.g2.fundboard.mapper.FundBoardMapper;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class FundBoardServiceImpl implements FundBoardService{

    private final FundBoardMapper fundBoardMapper;

    @Override
    public Long register(FundBoardDTO fundBoardDTO) {
        FundBoard fundBoard = fundBoardDTO.getDomain();

        fundBoardMapper.insert(fundBoard);

        Long fno = fundBoard.getFno();

        log.info("fno 여기입니다!!!!!!!!!!!!!!"+fno);

        fundBoardDTO.getTags().forEach(str->{
        fundBoardMapper.insertHashtag(fno, str);
        });

        return fundBoard.getFno();
    }


    @Override
    public PageResponseDTO<FundBoardDTO> getDTOList(PageRequestDTO pageRequestDTO) {

        List<FundBoardDTO> dtoList = fundBoardMapper.getList(pageRequestDTO).stream().map(fundBoard -> fundBoard.getDTO()).collect(Collectors.toList());

        int count = fundBoardMapper.getCount(pageRequestDTO);

        PageResponseDTO<FundBoardDTO> pageResponseDTO = PageResponseDTO.<FundBoardDTO>builder()
                .dtoList(dtoList)
                .count(count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public PageResponseDTO<FundBoardDTO> getEndList(PageRequestDTO pageRequestDTO) {
        List<FundBoardDTO> endList = fundBoardMapper.getEndList(pageRequestDTO).stream().map(fundBoard -> fundBoard.getDTO()).collect(Collectors.toList());
        // 종료된 펀딩목록

        int count = fundBoardMapper.getCount(pageRequestDTO);

        PageResponseDTO<FundBoardDTO> pageResponseDTO = PageResponseDTO.<FundBoardDTO>builder()
                .endList(endList)
                .count(count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public FundBoardDTO read(long fno) {

        FundBoard fundboard = fundBoardMapper.select(fno); //게시판조회

        fundBoardMapper.updateFundCnt(fno); //조회수

        List<String> strings = fundBoardMapper.selectHash(fno);

        fundboard.setTags(strings);

        return fundboard.getDTO();
    }

    @Override
    public boolean modify(FundBoardDTO fundBoardDTO) {

        FundBoard fundBoard = fundBoardDTO.getDomain();

        Long fno = fundBoard.getFno();

        if(fundBoardDTO.getTags() != null && fundBoardDTO.getTags().size() > 0){
            //기존 태그들을 모두 삭제
            fundBoardMapper.deleteHashtag(fno);
        }

        fundBoardDTO.getTags().forEach(str -> {
            log.info("-----------------------------------해시태그 수정-----------------------------------");
            log.info(str);

            fundBoardMapper.insertHashtag(fno, str); //해시태그등록

        });


        return fundBoardMapper.update(fundBoard) > 0;
    }


    @Override
    public void updateFundCnt(FundBoardDTO fundBoardDTO) {

        fundBoardMapper.updateFundCnt(fundBoardDTO.getFno());

    }

    @Override
    public boolean remove(long fno) {
        return fundBoardMapper.delete(fno) > 0;
    }



}
