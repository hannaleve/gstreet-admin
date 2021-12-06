package org.team.g2.security.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

@Configuration
@ComponentScan(basePackages = {"org.team.g2.security.controller","org.team.g2.memberboard.controller"})
@EnableGlobalMethodSecurity(prePostEnabled = true)
// ㄱ WebConfig의 getServletConfigClasses()에 연결
public class SecurityServletConfig {
}
