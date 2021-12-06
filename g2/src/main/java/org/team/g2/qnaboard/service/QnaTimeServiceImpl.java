package org.team.g2.qnaboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.qnaboard.mapper.QnaTimeMapper;

@Service
@Log4j2
@RequiredArgsConstructor
public class QnaTimeServiceImpl implements QnaTimeService{

    private final QnaTimeMapper qnaTimeMapper;

    @Override
    public String getNow1() {

        log.info("------service getQnaTIme()............");
        return qnaTimeMapper.getTime3();
    }
}
