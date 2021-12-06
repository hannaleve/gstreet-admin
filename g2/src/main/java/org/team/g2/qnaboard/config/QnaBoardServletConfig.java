package org.team.g2.qnaboard.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = "org.team.g2.qnaboard.controller")
public class QnaBoardServletConfig implements WebMvcConfigurer {
}

