package org.team.g2.memberboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.memberboard.dto.PageRequestDTO;
import org.team.g2.memberboard.dto.PageResponseDTO4;
import org.team.g2.memberboard.domain.MemberBoard;
import org.team.g2.memberboard.dto.MemberBoardDTO;
import org.team.g2.memberboard.mapper.MemberBoardMapper;
import org.team.g2.security.dto.MemberRoleDTO;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberBoardServiceImpl implements MemberBoardService {
	private final MemberBoardMapper memberBoardMapper;


	@Override
	public PageResponseDTO4<MemberBoardDTO> getMemberDTOList(PageRequestDTO pageRequestDTO) {
		log.warn("memberboardserviceimpl!!!!");

		List<MemberBoardDTO> dtoList = memberBoardMapper.getMemberList(pageRequestDTO).stream().map(memberBoard -> memberBoard.getMemberDTO()).collect(Collectors.toList());
		int count = memberBoardMapper.getCount(pageRequestDTO);

		PageResponseDTO4<MemberBoardDTO> pageResponseDTO4 = PageResponseDTO4.<MemberBoardDTO>builder()
				.dtoList(dtoList)
				.count(count)
				.build();

		return pageResponseDTO4;
	}

	@Override
	public String memberRegister(MemberBoardDTO memberBoardDTO) {
		log.warn("memberRegister Service.......................");
		log.warn("memberRegister Service.......................");
		log.warn("memberboarddto : " +memberBoardDTO);
		log.warn("memberboardmapper : "+ memberBoardMapper);
		log.warn("memberRegister Service.......................");
		log.warn("memberRegister Service.......................");

		MemberBoard memberBoard = memberBoardDTO.getDomain();
		log.warn("serviceimpl memberBoardDTO : " + memberBoardDTO);
		memberBoardMapper.insert4(memberBoard);
		String userID = memberBoard.getUserID();
		log.warn("serviceimpl userID : " + userID);
		log.warn("serviceimpl memberBoard : " + memberBoard);

		memberBoard.getAttachList().forEach(attach -> {
			attach.setUserID(userID);

			memberBoardMapper.insertAttach(attach);
		});

		return memberBoard.getUserID();
	}

	@Override
	public MemberBoardDTO read4(String userID) {
		MemberBoard memberBoard = memberBoardMapper.select4(userID);

		if (memberBoard != null) {
			return memberBoard.getMemberDTO();
		}

		return null;
	}

	@Override
	public boolean readB(MemberBoardDTO memberBoardDTO) {

		MemberBoard memberBoard =memberBoardDTO.getDomain();
		String userID = memberBoard.getUserID();

		return memberBoardMapper.update4(memberBoard) > 0 ;
	}

	@Override
	public List<MemberRoleDTO> getMemberRoleDTOList(String userID) {

		List<MemberRoleDTO> memberRoleDTOList = memberBoardMapper.getRoleList(userID);

		return memberBoardMapper.getRoleList(userID) ;
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		return memberBoardMapper.idCheck(memberId);
	}

	@Override
	public boolean ban(String userID) {
		return memberBoardMapper.ban(userID) > 0;
	}

	@Override
	public boolean unban(String userID) {
		return memberBoardMapper.unban(userID) > 0;
	}

	@Override
	public boolean grantMember(String userID) {
		return memberBoardMapper.grantMember(userID) > 0;
	}

	@Override
	public boolean grantSeller(String userID) {
		return memberBoardMapper.grantSeller(userID) > 0;
	}

	@Override
	public boolean grantAdmin(String userID) {
		return memberBoardMapper.grantAdmin(userID) > 0;
	}
}
