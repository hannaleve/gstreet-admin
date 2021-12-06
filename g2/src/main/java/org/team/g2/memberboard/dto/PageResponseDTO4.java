package org.team.g2.memberboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor

@NoArgsConstructor
public class PageResponseDTO4<E> {

	private List<E> dtoList;
	private int     count;
}
