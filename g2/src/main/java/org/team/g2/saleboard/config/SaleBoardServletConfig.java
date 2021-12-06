package org.team.g2.saleboard.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = "org.team.g2.saleboard.controller")
public class SaleBoardServletConfig implements WebMvcConfigurer {
}
