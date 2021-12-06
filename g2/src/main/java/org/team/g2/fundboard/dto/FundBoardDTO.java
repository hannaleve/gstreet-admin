package org.team.g2.fundboard.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.springframework.format.annotation.DateTimeFormat;
import org.team.g2.fundboard.domain.FundBoard;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Log4j2
@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FundBoardDTO {

    private long fno;
    private String ftitle;
    private String fcontent;
    private String fwriter;
    private LocalDateTime fregdate;
    private LocalDateTime fenddate;
    private Integer fcount, fprice, goalPrice;

    @Builder.Default
    private List<String> tags = new ArrayList<>(); // 해쉬태그 리스트

    public FundBoard getDomain() {

        FundBoard fundBoard = FundBoard.builder()
                .fno(fno)
                .ftitle(ftitle)
                .fcontent(fcontent)
                .fwriter(fwriter)
                .fregdate(fregdate)
                .fenddate(fenddate)
                .fcount(fcount)
                .fprice(fprice)
                .goalPrice(goalPrice)
                .build();

        tags.forEach(tag -> {
            fundBoard.addHashtag(tag);
        });

        return fundBoard;
    }
}
