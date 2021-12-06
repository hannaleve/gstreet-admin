package org.team.g2.reqboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.team.g2.reqboard.domain.ReqBoardAttach;
import org.team.g2.reqboard.domain.ReqBoard;
import org.team.g2.reqboard.domain.ReqLike;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReqBoardDTO {

    private Long bno;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime regDate;
    private LocalDateTime  modDate;
    private Integer reCount;
    private Integer likeCount;
    private double lat;
    private double lang;

    @Builder.Default
    private List<ReqLikeDTO> rl = new ArrayList<>();
    private List<String> tags = new ArrayList<>();

    @Builder.Default
    private List<UploadResponseDTO> files = new ArrayList<>();

    public ReqBoard getDomain() {
        ReqBoard reqBoard = ReqBoard.builder()
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
                .build();


        rl.forEach(reqLikeDTO -> {
            ReqLike reqLike = ReqLike.builder()
                    .userID(reqLikeDTO.getUserID())
                    .bno(reqLikeDTO.getBno())
                    .ltlike(reqLikeDTO.getLtlike())
                    .count(reqLikeDTO.getCount())
                    .build();

            reqBoard.addList(reqLike);



            tags.forEach(tag -> {
                reqBoard.addHash(tag);
            });

        });

        //파일업로드
        files.forEach(uploadResponseDTO -> {
            ReqBoardAttach attach = ReqBoardAttach.builder()
                    .fileName(uploadResponseDTO.getFileName())
                    .uuid(uploadResponseDTO.getUuid())
                    .image(uploadResponseDTO.isImage())
                    .path(uploadResponseDTO.getUploadPath())
                    .build();

            reqBoard.addAttach(attach);
        });
        return reqBoard;
    }



}
