package org.team.g2.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Log4j2
@Aspect
@Component
public class TimeLogAspect {
	{
		log.info("TimeLogAspect........");
		log.info("TimeLogAspect........");
		log.info("TimeLogAspect........");
	}

	@Before("execution(* org.team.g2.reqboard.service.*.*(..))")
	public void logBefore(JoinPoint joinPoint) {
		log.info("logBefore........");
		log.info(joinPoint.getTarget()); // getTarget : 실제 객체를 찍어줌
		log.info(Arrays.toString(joinPoint.getArgs()));
		log.info("logBefore.......end.");
	}

	@AfterReturning("execution(* org.team.g2.reqboard.service.*.*(..))")
	public void logAfter() {
		log.info("logAfter........");
	}
}
