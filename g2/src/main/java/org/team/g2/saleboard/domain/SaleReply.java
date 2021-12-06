package org.team.g2.saleboard.domain;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Builder
public class SaleReply {

    private Long rno;
    private Long sno;
    private String replier;
    private String reply;
    private LocalDateTime replyDate;
    private LocalDateTime modDate;
}
