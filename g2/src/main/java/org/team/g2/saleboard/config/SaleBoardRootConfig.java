package org.team.g2.saleboard.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@MapperScan(basePackages = "org.team.g2.saleboard.mapper")
@ComponentScan(basePackages = "org.team.g2.saleboard.service")
@Import(SaleBoardAOPConfig.class)
public class SaleBoardRootConfig {
}
