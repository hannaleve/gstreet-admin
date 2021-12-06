package org.team.g2.security.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.stereotype.Service;
import org.team.g2.security.domain.Member;
import org.team.g2.security.dto.MemberDTO;
import org.team.g2.security.mapper.MemberMapper;

import javax.sql.DataSource;

@Log4j2
@RequiredArgsConstructor
@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private final MemberMapper memberMapper;
	@Autowired
	private DataSource dataSource;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("CustomUserDetailsService......................");
		log.warn("CustomUserDetailsService......................");
		log.warn(username);
		log.warn(memberMapper);
		log.warn("CustomUserDetailsService......................");
		log.warn("CustomUserDetailsService......................");

		Member member = memberMapper.findByUserID(username);

		log.warn(member);

		if(member == null) {
			throw new UsernameNotFoundException("ID NOT EXIST");
		}

		User result = new MemberDTO(member);

		return result;
	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repository = new JdbcTokenRepositoryImpl();
		repository.setDataSource(dataSource);
		return repository;
	}
}
