package org.team.g2.memberboard.mapper;

import org.team.g2.memberboard.dto.PageRequestDTO;
import org.team.g2.memberboard.domain.MemberBoard;
import org.team.g2.memberboard.domain.MemberBoardAttach;
import org.team.g2.security.dto.MemberRoleDTO;

import java.util.List;

public interface MemberBoardMapper {
	List<MemberBoard> getMemberList(PageRequestDTO pageRequestDTO);

	void insert4(MemberBoard memberBoard);

	MemberBoard select4(String userID);

	int getCount(PageRequestDTO pageRequestDTO);
	
	int update4(MemberBoard memberBoard);

	int idCheck(String memberId);

	int insertAttach(MemberBoardAttach attach);

	List<MemberRoleDTO> getRoleList(String userID);

	int ban(String userID);

	int unban(String userID);

	int grantMember(String userID);

	int grantSeller(String userID);

	int grantAdmin(String userID);

}
