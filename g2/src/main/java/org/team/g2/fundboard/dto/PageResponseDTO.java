package org.team.g2.fundboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PageResponseDTO<E> {

//  private List<String> hashList;
    private List<E> dtoList;
    private List<E> endList;
    private int count;
}
