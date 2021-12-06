package org.team.g2.saleboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.team.g2.saleboard.domain.SaleBoard;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SaleBoardDTO {

    private Long sno;
    private String s_category;
    private String s_title;
    private String s_content;
    private String s_writer;
    private Integer s_viewCount;
    private Integer s_reCount;
    private LocalDateTime s_regDate;
    private LocalDateTime s_modDate;


    public SaleBoard getDomain() {
        SaleBoard saleBoard = SaleBoard.builder()
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

        return saleBoard;
    }
}
