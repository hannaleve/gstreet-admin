package org.team.g2.qnaboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.qnaboard.domain.QnaBoard;
import org.team.g2.qnaboard.dto.QnaBoardDTO;
import org.team.g2.qnaboard.mapper.QnaBoardMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class QnaBoardServiceImpl implements QnaBoardService{

    private final QnaBoardMapper qnaBoardMapper;

    @Override
    public Long register(QnaBoardDTO qnaBoardDTO) {
        QnaBoard qnaBoard = qnaBoardDTO.getDomain();

        qnaBoardMapper.insert(qnaBoard);

        return qnaBoard.getQno();
    }

    @Override
    public List<QnaBoardDTO> getDTOList() {

        return qnaBoardMapper.getList().stream().map(qnaBoard -> qnaBoard.getDTO()).collect(Collectors.toList());
    }

    @Override
    public QnaBoardDTO read(Long qno) {
        QnaBoard qnaBoard = qnaBoardMapper.read(qno);

        return qnaBoard.getDTO();
    }

    @Override
    public boolean remove(Long qno) {
        return qnaBoardMapper.delete(qno) > 0;
    }

    @Override
    public boolean modify(QnaBoardDTO qnaBoardDTO) {
        QnaBoard qnaBoard = qnaBoardDTO.getDomain();

        Long qno = qnaBoard.getQno();

        return qnaBoardMapper.update(qnaBoard) > 0;
    }
}
