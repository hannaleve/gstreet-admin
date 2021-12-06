package org.team.g2.reqboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.team.g2.reqboard.domain.ReqHashTag;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReqHashTagDTO {
    private String gubun;
    private Long num;
    private String tags;

    public ReqHashTag getDomain() {
        ReqHashTag reqHashTag = ReqHashTag.builder()
                .gubun(gubun)
                .num(num)
                .tags(tags)
                .build();

        return reqHashTag;
    }
}
