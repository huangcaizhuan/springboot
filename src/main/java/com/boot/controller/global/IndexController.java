package com.boot.controller.global;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.impl.manage.FunctionServiceImpl;
import com.boot.model.manage.Function;

@Controller
@ComponentScan({"com.boot.service"})
@MapperScan("com.boot.mapper")
@RequestMapping("/manage")
public class IndexController {

	@Autowired
	private FunctionServiceImpl  functionService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		
		List<Function> list = functionService.getAllFunction();
		request.setAttribute("list", list);
		return "index/index";
	}
	
	@RequestMapping("/manageIndex")
	public String manageIndex(HttpServletRequest request) {
		
		return "index/manageIndex";
	}
}
