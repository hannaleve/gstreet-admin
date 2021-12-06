package org.team.g2.common.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.team.g2.admin.config.AdminRootConfig;
import org.team.g2.fundboard.config.FundRootConfig;

import org.team.g2.memberboard.config.MemberBoardRootConfig;
import org.team.g2.qnaboard.config.QnaBoardRootConfig;
import org.team.g2.reqboard.config.ReqRootConfig;
import org.team.g2.saleboard.config.SaleBoardRootConfig;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
@Import({MemberBoardRootConfig.class,ReqRootConfig.class,AdminRootConfig.class, QnaBoardRootConfig.class, SaleBoardRootConfig.class, FundRootConfig.class})
public class RootConfig {

	@Bean
	public SqlSessionFactory sqlSessionFactory()throws Exception{
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());

		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public DataSource dataSource() {
		HikariConfig config = new HikariConfig();
		config.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		config.setJdbcUrl("jdbc:log4jdbc:mysql://106.241.252.51:1524/gstreet?allowMultiQueries=true&useUnicode=true&characterEncoding=utf-8");
		config.setUsername("gstreet");
		config.setPassword("gstreetpw");
//		config.setMaximumPoolSize(3);
		HikariDataSource dataSource = new HikariDataSource(config);
		return dataSource;
	}

	@Bean
	public TransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	} //db와 연결되어있으니까.

	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);

		mailSender.setUsername("gstreetmaster@gmail.com");
		mailSender.setPassword("gstreetmaster##");
		mailSender.setDefaultEncoding("utf-8");

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		return mailSender;
	}

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource source = new ReloadableResourceBundleMessageSource();
		source.setBasename("messages/messages_ko");
		source.setDefaultEncoding("UTF-8");
		return source;
	}


}

