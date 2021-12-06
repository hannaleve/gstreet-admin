package org.team.g2.common.config;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.team.g2.security.config.SecurityConfig;
import org.team.g2.security.config.SecurityServletConfig;


import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

@Log4j2
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		log.info("1.........................");
		log.info("1..........................");
		return new Class[]{RootConfig.class , SecurityConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[]{ServletConfig.class , SecurityServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[]{"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter uft8Filter = new CharacterEncodingFilter();
		uft8Filter.setEncoding("UTF-8");
		uft8Filter.setForceEncoding(true);

		return new Filter[]{uft8Filter};
	}


	@Override
	protected void customizeRegistration(ServletRegistration.Dynamic registration) { //첨부파일업로드 준비완료

		registration.setInitParameter("throwExceptionIfNoHandlerFound","true");

		MultipartConfigElement multipartConfigElement = new MultipartConfigElement("C:\\upload\\temp", 1024*1024*10,
				1024*1024*20, 1024*1024*1);
		registration.setMultipartConfig(multipartConfigElement);
	}
}
