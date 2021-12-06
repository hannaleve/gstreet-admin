package org.team.g2.admin.domain;

import lombok.*;
import org.team.g2.admin.dto.AdminBoardDTO;

import java.sql.Timestamp;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class AdminBoard {

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


    public AdminBoardDTO getMemberDTO() {
        AdminBoardDTO memberBoardDTO = AdminBoardDTO.builder()
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

        return memberBoardDTO;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }


}

