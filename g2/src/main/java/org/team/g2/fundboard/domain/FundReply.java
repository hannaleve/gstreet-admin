package org.team.g2.fundboard.domain;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FundReply {

    private Long frno;
    private Long fno;
    private String freplyer;
    private String freply;
    private LocalDateTime freplyDate;
    private LocalDateTime fmodDate;

}
