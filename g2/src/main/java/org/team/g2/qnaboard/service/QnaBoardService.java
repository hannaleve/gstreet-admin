package org.team.g2.qnaboard.service;

import org.team.g2.qnaboard.dto.QnaBoardDTO;


import java.util.List;

public interface QnaBoardService {

    Long register(QnaBoardDTO qnaBoardDTO);

    List<QnaBoardDTO> getDTOList();

    QnaBoardDTO read(Long qno);

    boolean remove(Long qno);

    boolean modify(QnaBoardDTO qnaBoardDTO);
}
