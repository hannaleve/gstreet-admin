package org.team.g2.security.domain;

import lombok.*;

import java.util.List;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member {

	private String userID;
	private String userPW;
	private boolean userEnabled;

	private List<MemberRole> roleList;
}
