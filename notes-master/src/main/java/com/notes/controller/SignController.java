package com.notes.controller;

import com.notes.mapper.SignMapper;
import com.notes.service.SignService;
import com.notes.vo.CalendarTable;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/sign")
@Slf4j
public class SignController {

    @Autowired
    SignService signService;

    @Autowired
    SignMapper signMapper;

    /**
     * 获取当月的签到表
     * */
    @GetMapping("/getSignTable/{year}/{month}/{account}")
    public CalendarTable getSignTable(@PathVariable int year, @PathVariable int month, @PathVariable String account){
        log.info("刷新签到表成功!");
        return signService.getSignTable(year,month,account);
    }

    /**
     * 判断当前用户今天是否注册
     * */
    @GetMapping("/isSignIn/{account}")
    public boolean isSignIn(@PathVariable String account){
        return signService.isSignIn(account);
    }

    /**
     * 签到
     * */
    @GetMapping("/signIn/{account}")
    public String signIn(@PathVariable String account){
        return signService.signIn(account);
    }
}
