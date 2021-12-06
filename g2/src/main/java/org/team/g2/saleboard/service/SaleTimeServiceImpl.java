package org.team.g2.saleboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.team.g2.saleboard.mapper.SaleTimeMapper;


@Service
@Log4j2
@RequiredArgsConstructor
public class SaleTimeServiceImpl implements SaleTimeService {

    private final SaleTimeMapper saleTimeMapper;

    @Override
    public String getNow() {

        log.info("service...........getNow()");

        return saleTimeMapper.getTime2();
    }
}
