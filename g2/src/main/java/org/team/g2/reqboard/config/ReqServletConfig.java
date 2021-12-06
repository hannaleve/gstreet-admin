package org.team.g2.reqboard.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@ComponentScan(basePackages = "org.team.g2.reqboard.controller")
public class ReqServletConfig {
}
