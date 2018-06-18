package com.boot.controller;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@ComponentScan({"com.boot.service"})
@MapperScan("com.boot.mapper")
public class IndexController {

	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		System.out.println("wwwwwwwwwwww");
		return "index";
	}
}
