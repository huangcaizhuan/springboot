package com.boot.controller.global;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.global.manage.DefaultJSON;
import com.boot.impl.manage.ManagerServiceImpl;
import com.boot.model.manage.Manager;
import com.boot.tools.util.security.MD5;
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
		obj.put("img", ValidateCode.getValidateCode(request, response,"manageValidateCode"));
		return obj;
	}
	/**
	 * 验证码验证
	 * @param request
	 * @param response
	 * @param validateCode
	 * @return
	 */
	@RequestMapping("/checkValidateCodeAjax")
	@ResponseBody
	public JSONObject checkValidateCodeAjax(HttpServletRequest request,HttpServletResponse response) {
		
		String validateCode  = request.getParameter("validateCode");
		
		JSONObject jsonReturn = DefaultJSON.getDefaultJSON();
		if(StringUtils.isEmpty(validateCode)) {
			jsonReturn.put("success", false);
			jsonReturn.put("msg", "请输入验证码");
			return jsonReturn;
		}
		
		String sessionValue = (String) request.getSession().getAttribute("manageValidateCode");
		if( StringUtils.isEmpty(sessionValue) || !sessionValue.equals(validateCode)) {
			jsonReturn.put("success", false);
			jsonReturn.put("msg", "验证码错误");
			return jsonReturn;
		}
		
		jsonReturn.put("success", true);
		return jsonReturn;
	}
	
	/**
	 * 登录请求
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value ="/loginAjax",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject loginAjax(HttpServletRequest request,HttpServletResponse response) {
		
		JSONObject jsonReturn = DefaultJSON.getDefaultJSON();
		String accountStr = request.getParameter("accountStr");
		String password = request.getParameter("password");
		
		if(StringUtils.isEmpty(accountStr) ||  StringUtils.isEmpty(password)) {
			jsonReturn.put("success", false);
			jsonReturn.put("msg", "用户名或密码为空");
			return jsonReturn;
		} 
		Manager manager = managerService.getByNameOrTelAndPassword(accountStr, MD5.digest(password));
		if(manager == null) {
			jsonReturn.put("success", false);
			jsonReturn.put("msg", "用户名或密码错误");
			return jsonReturn;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginManager", manager);
		session.setAttribute("managerId", manager.getRoleId());
		
		jsonReturn.put("success", true);
		return jsonReturn;
	}
	
	/**
	 * 登录请求
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value ="/logoutAjax",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject logoutAjax(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonReturn = DefaultJSON.getDefaultJSON();
		
		request.getSession().removeAttribute("loginManager");
		request.getSession().removeAttribute("managerId");
		
		return jsonReturn;
	}
}
