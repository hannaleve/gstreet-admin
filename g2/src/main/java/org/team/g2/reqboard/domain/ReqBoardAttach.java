package org.team.g2.reqboard.domain;

import lombok.*;

@Getter
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReqBoardAttach {

    private String uuid;
    private Long bno;
    private String path;
    private String fileName;
    private boolean image;

    public void setBno(Long bno) {
        this.bno = bno;
    }

}
