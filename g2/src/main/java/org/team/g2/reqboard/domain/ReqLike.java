package org.team.g2.reqboard.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.team.g2.reqboard.dto.ReqLikeDTO;


@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Log4j2
public class ReqLike {

    private String userID;
    private Long bno;
    private int ltlike;
    private int count = 0;


public ReqLikeDTO getDTO() {
    ReqLikeDTO reqBoardDTO = ReqLikeDTO.builder()
            .userID(userID)
            .bno(bno)
            .ltlike(ltlike)
            .count(count)
            .build();

    return reqBoardDTO;
}








}
