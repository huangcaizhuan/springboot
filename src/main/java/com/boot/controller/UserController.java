package com.boot.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.model.User;
import com.boot.service.UserService;

/**
 * 前端控制器类，调用业务层方法处理请求
 * @author Administrator
 *
 */
@Controller
@ComponentScan({"com.boot.service"})
@MapperScan("com.boot.mapper")
public class UserController {
	
	@Resource
	private UserService  userService;
	
	/**
	 * 根据id查询出对应的用户
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/findById")
	public String findById(HttpServletRequest request){
		
		System.out.println("heheheheh");
		User user = userService.find(18);
		request.setAttribute("user", user);
		return "first/showUser";
	}
	
	@RequestMapping("/skip")
	public String skip(HttpServletRequest request){
		User user = userService.find(18);
		request.setAttribute("user", user);
		return "skip/skipped";
	}
	
}
