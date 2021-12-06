package org.team.g2.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.team.g2.admin.config.AdminRootConfig;
import org.team.g2.admin.mapper.AdminMapper;
import org.team.g2.common.config.RootConfig;


@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration( classes = {AdminRootConfig.class, RootConfig.class} )
public class AdminMapperTests {
    @Autowired
    AdminMapper adminMapper;

    @Test
    public void testGetStat() {
        log.info(adminMapper.getStat());
    }

    @Test
    public void testHashList() {
        log.info(adminMapper.hashList());
    }


}
