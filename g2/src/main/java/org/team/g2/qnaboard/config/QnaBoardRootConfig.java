package org.team.g2.qnaboard.config;

import org.mybatis.spring.annotation.MapperScan;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@MapperScan(basePackages = "org.team.g2.qnaboard.mapper")
@ComponentScan(basePackages = "org.team.g2.qnaboard.service")
public class QnaBoardRootConfig {
}
