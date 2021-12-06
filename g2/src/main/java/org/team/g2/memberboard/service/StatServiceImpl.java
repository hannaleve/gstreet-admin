package org.team.g2.memberboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.memberboard.mapper.StatMapper;

@Service
@RequiredArgsConstructor
@Log4j2
public class StatServiceImpl implements StatService{
	private final StatMapper statMapper;

	@Override
	public String getStatOne() {

		log.info("stat service");
		return statMapper.getStat();
	}

	@Override
	public String getStatTwo() {
		return statMapper.getStat2();
	}
}
