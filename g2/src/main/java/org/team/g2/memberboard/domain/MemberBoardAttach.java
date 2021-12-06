package org.team.g2.memberboard.domain;

import lombok.*;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberBoardAttach {
	private String  userUuid;
	private String  userID;
	private String  userFileName;
	private String  userFilePath;
	private boolean userImageCheck;

	public void setUserID(String userID) {
		this.userID = userID;
	}
}
