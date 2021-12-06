package org.team.g2.admin.dto;

import lombok.*;
import org.team.g2.admin.domain.AdminBoard;
import org.team.g2.reqboard.dto.UploadResponseDTO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdminBoardDTO {

    private String    userID;
    private String    userPW;
    private String    userName;
    private String    userRegNum;
    private String    userPhone;
    private String    userAddress;
    private String    userNickname;
    private String    userEmail;
    private String    userAddress2;
    private String    userZipCode;
    private String    userAddressExtra;
    private String    userAddressDetail;
    private Timestamp userRegDate;


    public AdminBoard getDomain() {
        AdminBoard memberBoard = AdminBoard.builder()
                .userID(userID)
                .userPW(userPW)
                .userName(userName)
                .userRegNum(userRegNum)
                .userPhone(userPhone)
                .userAddress(userAddress)
                .userNickname(userNickname)
                .userEmail(userEmail)
                .userZipCode(userZipCode)
                .userAddress2(userAddress2)
                .userAddressExtra(userAddressExtra)
                .userAddressDetail(userAddressDetail)
                .userRegDate(userRegDate)
                .build();

        return memberBoard;
    }
}

