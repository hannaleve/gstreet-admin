package org.team.g2.admin.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.team.g2.reqboard.config.ReqBoardAOPConfig;

@Configuration
@MapperScan(basePackages = "org.team.g2.admin.mapper")
@ComponentScan(basePackages = "org.team.g2.admin.service")
public class AdminRootConfig {
}
