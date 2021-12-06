package org.team.g2.common.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

//@ControllerAdvice //예외를 처리하는 존재임을 명시
@Log4j2
public class CommonExceptionAdivce {

    @ExceptionHandler(Exception.class)
    public String exceptAll(Exception ex, Model model){ //500에러처리
        log.error(ex.getMessage());
        model.addAttribute("exception",ex);
        return "error_page";
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404(NoHandlerFoundException ex) {//400에러처리
        return "custom404";
    }

    @ExceptionHandler(ArithmeticException.class)
    public String exceptArithmetic(ArithmeticException ex, Model model) {
        log.error(ex.getClass().getName());
        log.error(ex.getMessage());

        model.addAttribute("exception",ex);

        return "error_arithe_page"; //만들지 않아서 최고조상인 exception에러로 위에있음
    }
}
