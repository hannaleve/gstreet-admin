package org.team.g2.qnaboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.team.g2.qnaboard.domain.QnaBoard;


import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaBoardDTO {

    private Long qno;
    private String qtitle;
    private String qcontent;
    private String qwriter;
    private LocalDateTime regDate;


    public QnaBoard getDomain() {

        QnaBoard qnaBoard = QnaBoard.builder()
                .qno(qno)
                .qtitle(qtitle)
                .qcontent(qcontent)
                .qwriter(qwriter)
                .regDate(regDate)
                .build();

        return qnaBoard;
    }

}
