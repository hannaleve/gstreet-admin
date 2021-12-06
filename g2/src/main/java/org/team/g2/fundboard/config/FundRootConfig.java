package org.team.g2.fundboard.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "org.team.g2.fundboard.mapper")
@ComponentScan(basePackages = "org.team.g2.fundboard.service")
public class FundRootConfig {
}
