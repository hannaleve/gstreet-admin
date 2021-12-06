package org.team.g2.memberboard.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = "org.team.g2.memberboard.controller")
public class MemberBoardServletConfig implements WebMvcConfigurer {
}
