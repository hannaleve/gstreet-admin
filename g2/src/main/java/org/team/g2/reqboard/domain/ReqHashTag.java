package org.team.g2.reqboard.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.team.g2.reqboard.dto.ReqHashTagDTO;


@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Log4j2
public class ReqHashTag {
    private String gubun;
    private Long num;
    private String tags;


    public ReqHashTagDTO getDTO() {
        ReqHashTagDTO reqHashTagDTO = ReqHashTagDTO.builder()
                .gubun(gubun)
                .num(num)
                .tags(tags)
                .build();

        return reqHashTagDTO;
    }
}
