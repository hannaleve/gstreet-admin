package org.team.g2.saleboard.domain;

import lombok.*;
import org.team.g2.saleboard.dto.SaleBoardDTO;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SaleBoard {
    private Long sno;
    private String s_category,s_title,s_content,s_writer;
    private LocalDateTime s_regDate, s_modDate;
    private Integer s_viewCount,s_reCount;

    public SaleBoardDTO getDTO() {
        SaleBoardDTO saleBoardDTO = SaleBoardDTO.builder()
                .sno(sno)
                .s_category(s_category)
                .s_title(s_title)
                .s_content(s_content)
                .s_writer(s_writer)
                .s_viewCount(s_viewCount)
                .s_reCount(s_reCount)
                .s_regDate(s_regDate)
                .s_modDate(s_modDate)
                .build();

        return saleBoardDTO;
    }

    public void setSno(Long sno) {
        this.sno = sno;
    }
}
