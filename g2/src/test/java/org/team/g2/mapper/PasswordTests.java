package org.team.g2.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.team.g2.common.config.RootConfig;
import org.team.g2.security.mapper.MemberMapper;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class})
public class PasswordTests {

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired(required = false) //@Autowired에러나면 required로 false를 준다!
    MemberMapper memberMapper;

    @Test
    public void testEncode() {
        String str = "member1";
        String enStr = passwordEncoder.encode(str);
        log.warn(enStr);
    }

    @Test
    public void testDecode() {
        String str ="$2a$10$eRpYkjEIPg0gclSwD3SVH..KckAVrjXV.mxpCuQpLi3JHIbAovkKS";
        boolean match = passwordEncoder.matches("member1",str);
        log.info(match);
    }
    @Test
    public void insertMember() {

        //insert into tbl_member (mid,mpw,mname) values ('mid','mpw','mname');

        String query = "insert into tbl_member (userID,userPW) values ('v1','v2');";

        for (int i = 0; i < 10; i++) {

            String userID = "user" + i; //user0
            String userPW = passwordEncoder.encode("pw" + i); //pw0 -> Bcrypted


            String result = query;


            result = result.replace("v1", userID);
            result = result.replace("v2", userPW);

            System.out.println(result);
        }
    }
}
