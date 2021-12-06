package org.team.g2.saleboard.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Arrays;


@Aspect
@Log4j2
@Component
public class SaleTimeLogAspect {

    {
        log.info("TimeLogAspect.................");
        log.info("TimeLogAspect.................");
        log.info("TimeLogAspect.................");
        log.info("TimeLogAspect.................");
        log.info("TimeLogAspect.................");
    }

    @Before("execution(* org.team.g2.saleboard.service.*.*(..))")
    public void logBefore(JoinPoint joinPoint) {

        log.info("logBefore.........................");

        log.info(joinPoint.getTarget());// 실제 객체
        log.info(Arrays.toString(joinPoint.getArgs()));
    }

    @AfterReturning("execution(* org.team.g2.saleboard.service.*.*(..))")
    public void logAfter() {

        log.info("logAfter.........................");
    }
}

