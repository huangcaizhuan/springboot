package com.boot.controller.global;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.impl.manage.ManagerServiceImpl;
import com.boot.tools.util.validate.ValidateCode;

import net.sf.json.JSONObject;

@Controller
@ComponentScan({"com.boot.service"})
@MapperScan("com.boot.mapper")
@RequestMapping("/manage")
public class LoginController {

	@Autowired
	private ManagerServiceImpl  managerService;
	
	/**
	 * 登录页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response) {
		
		return "index/login";
	}
	
	/**
	 * 登录验证码
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/validateCode")
	@ResponseBody
	public JSONObject validateCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		JSONObject obj = new JSONObject();
		obj.put("img", ValidateCode.getValidateCode(request, response));
		return obj;
	}
	
	/**
	 * 登录请求
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value ="/loginAjax",method = RequestMethod.POST)
	public String loginAjax(HttpServletRequest request,HttpServletResponse response) {
		
		String param = request.getParameter("param");
		System.out.println(param);
		return "index/index";
	}
}
