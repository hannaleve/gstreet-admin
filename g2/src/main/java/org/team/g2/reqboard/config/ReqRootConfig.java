package org.team.g2.reqboard.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@MapperScan(basePackages = "org.team.g2.reqboard.mapper")
@ComponentScan(basePackages = "org.team.g2.reqboard.service")
@Import(ReqBoardAOPConfig.class)
public class ReqRootConfig {
}
