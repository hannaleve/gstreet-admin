package org.team.g2.memberboard.dto;

import lombok.*;
import org.team.g2.memberboard.domain.MemberBoard;
import org.team.g2.memberboard.domain.MemberBoardAttach;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberBoardDTO {

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
	private String    userRole;
	private boolean   userEnabled;
	private Timestamp userRegDate;


	@Builder.Default
	private List<UploadResponseDTO4> files = new ArrayList<>();


	public MemberBoard getDomain() {
		MemberBoard memberBoard = MemberBoard.builder()
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

		files.forEach(uploadResponseDTO4 -> {
			MemberBoardAttach attach = MemberBoardAttach.builder()
					.userFileName(uploadResponseDTO4.getUserFileName())
					.userUuid(uploadResponseDTO4.getUserUuid())
					.userImageCheck(uploadResponseDTO4.isUserImageCheck())
					.userFilePath(uploadResponseDTO4.getUserFilePath())
					.build();

			memberBoard.addAttach(attach);

		});

		return memberBoard;
	}
}
