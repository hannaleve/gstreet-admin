package org.team.g2.reqboard.domain;

import lombok.*;
import org.team.g2.reqboard.dto.ReqBoardDTO;
import org.team.g2.reqboard.dto.UploadResponseDTO;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReqBoard {
    private Long bno;
    private String title,content,writer;
    private LocalDateTime regDate, modDate;
    private Integer reCount,likeCount;
    private double lat,lang;

    @Builder.Default
    private List<ReqLike> rl = new ArrayList<>();
    private List<String> reqHashTags = new ArrayList<>();
    @Builder.Default
    private List<String> reqHashTags2 = new ArrayList<>();

    @Builder.Default
    private List<ReqBoardAttach> attachList = new ArrayList<>();

    private List<ReqHashTag> hashList = new ArrayList<>();

    public ReqBoardDTO getDTO() {

        List<String> hashListStr = null;

        if(hashList != null){
            hashListStr = hashList.stream().map(hashObj ->hashObj.getTags()).collect(Collectors.toList());
        }



        ReqBoardDTO reqBoardDTO = ReqBoardDTO.builder()
                .bno(bno)
                .title(title)
                .content(content)
                .writer(writer)
                .regDate(regDate)
                .modDate(modDate)
                .reCount(reCount)
                .likeCount(likeCount)
                .lat(lat)
                .lang(lang)
                .tags(reqHashTags2)
//                .tags(hashListStr)
                .build();

        List<ReqBoardDTO> reqBoardDTOList = rl.stream().map(rl -> {
            ReqBoardDTO reqBoardDTO1 = ReqBoardDTO.builder()
                    .bno(rl.getBno())
                    .likeCount(rl.getLtlike())
                    .build();
            return reqBoardDTO1;
        }).collect(Collectors.toList());

        List<UploadResponseDTO> uploadResponseDTOList = attachList.stream().map(attach -> {
            UploadResponseDTO uploadResponseDTO = UploadResponseDTO.builder()
                    .uuid(attach.getUuid())
                    .fileName(attach.getFileName())
                    .uploadPath(attach.getPath())
                    .image(attach.isImage())
                    .build();
            return uploadResponseDTO;
        }).collect(Collectors.toList());

        reqBoardDTO.setFiles(uploadResponseDTOList);

        return reqBoardDTO;
    }

    public void setBno(Long bno) {
        this.bno = bno;
    }

    public int getRecount(){
        return reCount;
    }
    public void setRegCount(int reCount) {
        this.reCount = reCount;
    }

    public void addList(ReqLike reqLike) {
        rl.add(reqLike);
    }


    public void addAttach(ReqBoardAttach attach) { //첨부파일등록
        attachList.add(attach);
    }

    public void addHash(String hashTage) {
        reqHashTags.add(hashTage);
    }

    public void setTags(List<String> tags) {
        this.reqHashTags2 = tags;
    }

    public void HashSelect(String hashTages) {
        reqHashTags2.add(hashTages);
    }

}
