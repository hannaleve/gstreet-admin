package org.team.g2.qnaboard.domain;

import lombok.*;
import org.team.g2.qnaboard.dto.QnaBoardDTO;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaBoard {
    private Long qno;
    private String qtitle,qcontent,qwriter;
    private LocalDateTime regDate;

    public QnaBoardDTO getDTO(){
        QnaBoardDTO qnaBoardDTO = QnaBoardDTO.builder()
                .qno(qno)
                .qtitle(qtitle)
                .qcontent(qcontent)
                .qwriter(qwriter)
                .regDate(regDate)
                .build();
        return qnaBoardDTO;
    }
}
