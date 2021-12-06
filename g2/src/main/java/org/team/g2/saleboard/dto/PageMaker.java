package org.team.g2.saleboard.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {

    private int start, end, page, size, total;
    private boolean prev, next;

    public PageMaker(int page, int size, int total) {

        this.page = page;
        this.size = size;
        this.total = total;

        //마지막 페이지
        end = (int) (Math.ceil(page / 5.0) * 5);
        start = end - 4;
        prev = start > 1;
        next = (total / (double) size) > end;

        end = end * size > total ? (int) (Math.ceil(total / (double) size)) : end;

    }
}

