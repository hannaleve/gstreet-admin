package org.team.g2.reqboard.dto;

import lombok.*;
import org.team.g2.reqboard.domain.ReqLike;

@Getter
@Setter
@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReqLikeDTO {
    private String userID;
    private Long bno;
    private int ltlike;
    private int count;

    public ReqLike getDTO() {
        ReqLike reqBoardDTO = ReqLike.builder()
                .userID(userID)
                .bno(bno)
                .ltlike(ltlike)
                .count(count)
                .build();

        return reqBoardDTO;
    }

}
