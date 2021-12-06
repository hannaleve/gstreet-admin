package org.team.g2.fundboard.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.team.g2.fundboard.dto.FundBoardDTO;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FundBoard {

    private Long fno;
    private Integer fcount, fprice, goalPrice;
    private String ftitle,fcontent,fwriter;

    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime fregdate, fenddate;

    @Builder.Default
    private List<String> hashtagList = new ArrayList<>();

    @Builder.Default
    private List<String> hashtagList2 = new ArrayList<>();

    private List<FundBoardHashtag> hashList = new ArrayList<>(); // 해시태그 검색

    @Builder.Default
    private List<FundBoardAttach> attachList = new ArrayList<>(); //Board안에 BoardAttach 첨부파일 내용 필요

    public FundBoardDTO getDTO() {

        List<String> hashListStr = null;

        if(hashList != null){ //해시리스트가 String으로 받았기때문에
            hashListStr = hashList.stream().map(hashObj ->hashObj.getTags()).collect(Collectors.toList());
        }

        FundBoardDTO fundBoardDTO = FundBoardDTO.builder()
                .fno(fno)
                .ftitle(ftitle)
                .fcontent(fcontent)
                .fwriter(fwriter)
                .fregdate(fregdate)
                .fenddate(fenddate)
                .fcount(fcount)
                .fprice(fprice)
                .goalPrice(goalPrice)
                .tags(hashtagList2)
                .build();
//
//        // 해쉬태그 추가
//        List<String> hashtagDTOList = hashtagList.stream().collect(Collectors.toList());
//
//        fundBoardDTO.setTags(hashtagDTOList);

        return fundBoardDTO;
    }

    public void setFno(Long fno) {
        this.fno = fno;
    }

    public void setTags(List<String> tags) {this.hashtagList2 = tags; } // 조회시 해시태그

    public void addHashtag(String hashtag){
        hashtagList.add(hashtag);
    } // 등록

    public void hashSelect(String hashTags) {
        hashtagList2.add(hashTags); //해시태그조회
    }

    public void addAttach(FundBoardAttach attach) { //첨부파일 등록
        attachList.add(attach);
    }

}
