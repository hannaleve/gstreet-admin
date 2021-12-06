package org.team.g2.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.team.g2.common.config.RootConfig;
import org.team.g2.reqboard.mapper.TimeMapper;

import javax.sql.DataSource;
import java.util.ArrayList;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {RootConfig.class})
public class TimeMapperTests {

	@Autowired
	ArrayList<String> names;

	@Autowired
	DataSource dataSource;


	@Autowired
	TimeMapper timeMapper;



	@Test
	public void testTime() {
		log.info(timeMapper);
		log.info(timeMapper.getTime());
	}



}
