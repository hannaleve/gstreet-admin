package org.team.g2.security.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.team.g2.security.domain.Member;

import java.util.Collection;
import java.util.stream.Collectors;

@Getter
@Setter
public class MemberDTO extends User {

	private String userID;
	private String userPW;
	private boolean userEnabled;


	//ㄱ memberRole
	public MemberDTO(Member member) {
		super(member.getUserID(), member.getUserPW(), member.getRoleList().stream().map(memberRole -> new SimpleGrantedAuthority(
				memberRole.getRole())).collect(Collectors.toList()));

		this.userID = member.getUserID();
		this.userPW = member.getUserPW();
		this.userEnabled = member.isUserEnabled();

	}

}
