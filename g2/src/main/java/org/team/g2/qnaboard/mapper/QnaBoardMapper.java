package org.team.g2.qnaboard.mapper;

import org.team.g2.qnaboard.domain.QnaBoard;

import java.util.List;

public interface QnaBoardMapper {

    void insert(QnaBoard qnaBoard);

    List<QnaBoard> getList();

    QnaBoard read(Long qno);

    int delete (Long qno);

    int update (QnaBoard qnaBoard);

}
