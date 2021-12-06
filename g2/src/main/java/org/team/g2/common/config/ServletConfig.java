package org.team.g2.common.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.format.FormatterRegistry;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.team.g2.admin.config.AdminServletConfig;
import org.team.g2.common.converter.StringToLocalDateTimeConverter;
import org.team.g2.fundboard.config.FundServletConfig;
import org.team.g2.memberboard.config.MemberBoardServletConfig;
import org.team.g2.qnaboard.config.QnaBoardServletConfig;
import org.team.g2.reqboard.config.ReqServletConfig;
import org.team.g2.saleboard.config.SaleBoardServletConfig;

@EnableWebMvc
@Import({MemberBoardServletConfig.class,ReqServletConfig.class, AdminServletConfig.class, QnaBoardServletConfig.class, SaleBoardServletConfig.class, FundServletConfig.class})
@ComponentScan(basePackages = {"org.team.g2.common.exception"})
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ServletConfig implements WebMvcConfigurer {
	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addConverter(new StringToLocalDateTimeConverter());
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {

		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

}