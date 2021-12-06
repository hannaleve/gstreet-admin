package org.team.g2.fundboard.dto;

import lombok.*;
import org.team.g2.fundboard.domain.FundBoardHashtag;

@Data
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HashtagDTO {

    private Long num;
    private String gubun;
    private String tags;

    public FundBoardHashtag getDomain(){
        FundBoardHashtag fundBoardHashtag = FundBoardHashtag.builder()
                .num(num)
                .gubun(gubun)
                .tags(tags)
                .build();

        return fundBoardHashtag;

    }
}
