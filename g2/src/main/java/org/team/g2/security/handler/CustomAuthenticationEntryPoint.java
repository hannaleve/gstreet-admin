package org.team.g2.security.handler;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {
	@Override
	public void commence(HttpServletRequest req, HttpServletResponse res, AuthenticationException authException) throws IOException, ServletException {

		log.warn("------------------CustomAuthenticationEntryPoint-----------------");
		log.error("------------------CustomAuthenticationEntryPoint-----------------");
		log.warn(authException);
		log.error("------------------CustomAuthenticationEntryPoint-----------------");
		log.warn("------------------CustomAuthenticationEntryPoint-----------------");

		if(req.getContentType() != null && req.getContentType().contains("json")){
			res.setContentType("application/json;charset=UTF-8");
			res.setStatus(403);
			res.getWriter().write("{\'msg\':\'REST API ERROR!! \'}");
		}else {

			res.sendRedirect("/customLogin?err");
		}



	}
}
