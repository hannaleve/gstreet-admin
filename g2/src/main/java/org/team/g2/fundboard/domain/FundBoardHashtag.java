package org.team.g2.fundboard.domain;

import lombok.*;
import org.team.g2.fundboard.dto.FundBoardDTO;
import org.team.g2.fundboard.dto.HashtagDTO;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FundBoardHashtag {

    private Long num;
    private String gubun;
    private String tags;

    public HashtagDTO getDTO(){
        HashtagDTO hashtagDTO = HashtagDTO.builder()
                .num(num)
                .gubun(gubun)
                .tags(tags)
                .build();

        return hashtagDTO;
    }
}

