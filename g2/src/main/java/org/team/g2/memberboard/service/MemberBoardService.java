package org.team.g2.memberboard.service;

import org.team.g2.memberboard.dto.PageRequestDTO;
import org.team.g2.memberboard.dto.PageResponseDTO4;
import org.team.g2.memberboard.dto.MemberBoardDTO;
import org.team.g2.security.dto.MemberRoleDTO;

import java.util.List;

public interface MemberBoardService {

	PageResponseDTO4<MemberBoardDTO> getMemberDTOList(PageRequestDTO pageRequestDTO);

	String memberRegister(MemberBoardDTO memberBoardDTO);

	MemberBoardDTO read4(String userID);

	boolean readB(MemberBoardDTO memberBoardDTO);

	int idCheck(String memberId) throws Exception;

	List<MemberRoleDTO> getMemberRoleDTOList(String userID);

	boolean ban(String userID);

	boolean unban(String userID);

	boolean grantMember(String userID);

	boolean grantSeller(String userID);

	boolean grantAdmin(String userID);
}
