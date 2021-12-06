package org.team.g2.memberboard.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;


@Configuration
@MapperScan(basePackages = "org.team.g2.memberboard.mapper")
@ComponentScan(basePackages = {"org.team.g2.memberboard.service"})
//@Import(MemberBoardAOPConfig.class)
public class MemberBoardRootConfig {

}
