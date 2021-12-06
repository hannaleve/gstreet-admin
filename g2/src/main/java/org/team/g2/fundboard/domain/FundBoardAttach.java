package org.team.g2.fundboard.domain;

import lombok.*;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FundBoardAttach {

    private String uuid;
    private Long fno;
    private String fileName;
    private String uploadPath;
    private boolean image;

    public void setFno(Long fno){
        this.fno = fno;
    }

}
