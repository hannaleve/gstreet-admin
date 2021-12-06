package org.team.g2.security.mapper;

import org.team.g2.security.domain.Member;

public interface MemberMapper {
	Member findByUserID(String userID);
}
