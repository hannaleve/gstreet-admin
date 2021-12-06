package org.team.g2.memberboard.domain;

import lombok.*;
import org.team.g2.memberboard.dto.MemberBoardDTO;
import org.team.g2.memberboard.dto.UploadResponseDTO4;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberBoard {

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
	private String    userRole;
	private boolean   userEnabled;

	@Builder.Default
	private List<MemberBoardAttach> attachList = new ArrayList<>();

	public MemberBoardDTO getMemberDTO() {
		MemberBoardDTO memberBoardDTO = MemberBoardDTO.builder()
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
				.userRole(userRole)
				.userEnabled(userEnabled)
				.build();


		List<UploadResponseDTO4> uploadResponseDTO4List = attachList.stream().map(attach -> {
			UploadResponseDTO4 uploadResponseDTO4 = UploadResponseDTO4.builder()
					.userUuid(attach.getUserUuid())
					.userFileName(attach.getUserFileName())
					.userFilePath(attach.getUserFilePath())
					.userImageCheck(attach.isUserImageCheck())
					.build();
			return uploadResponseDTO4;
		}).collect(Collectors.toList());

		memberBoardDTO.setFiles(uploadResponseDTO4List);

		return memberBoardDTO;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void addAttach(MemberBoardAttach attach) {
		attachList.add(attach);
	}
}
