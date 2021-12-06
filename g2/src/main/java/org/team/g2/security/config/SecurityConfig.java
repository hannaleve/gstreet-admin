package org.team.g2.security.config;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.team.g2.security.handler.CustomAuthenticationEntryPoint;
import org.team.g2.security.handler.CustomLoginSuccessHandler;
import org.team.g2.security.service.CustomUserDetailsService;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
@Log4j2
@MapperScan(basePackages = "org.team.g2.security.mapper")
@ComponentScan(basePackages = "org.team.g2.security.service")
@RequiredArgsConstructor
@AllArgsConstructor
//ㄱ common/WebConfig getRootConfigClasses()에 연결
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	{
		log.info("SecurityConfig!!!!");
		log.info("SecurityConfig!!!!");
		log.info("SecurityConfig!!!!");
	}

	@Autowired
	private CustomUserDetailsService customUserDetailsService;



	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/sample/doAdmin").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/sample/doMember").access("hasRole('ROLE_MEMBER')")
				.antMatchers("/sample/doAll","/memberboard/register").permitAll();

		http.formLogin().loginPage("/customLogin")
				.loginProcessingUrl("/login");
//				.successHandler(customLoginSuccessHandler());

		http.logout().invalidateHttpSession(true);
		http.csrf().disable();
		http.rememberMe().tokenRepository(customUserDetailsService.persistentTokenRepository())
				.key("gstreet").tokenValiditySeconds(60*60*24*7);
		http.exceptionHandling().authenticationEntryPoint(customAuthenticationEntryPoint());


	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService);
		//		auth.inMemoryAuthentication().withUser("member1").password("{noop}member1").roles("MEMBER");
		//		auth.inMemoryAuthentication().withUser("admin1").password("{noop}admin1").roles("MEMBER","ADMIN");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public CustomLoginSuccessHandler customLoginSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	@Bean
	public CustomAuthenticationEntryPoint customAuthenticationEntryPoint(){
		return new CustomAuthenticationEntryPoint();
	}

//	@Bean
//	public CustomUserDetailsService customUserDetailsService() {
//		return new CustomUserDetailsService();
//	}
}
