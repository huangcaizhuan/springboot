package com.boot.controller.manageController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.impl.manage.FunctionServiceImpl;
import com.boot.model.manage.Function;

import net.sf.json.JSONObject;

@Controller
@ComponentScan({"com.boot.service"})
@MapperScan("com.boot.mapper")
@RequestMapping("/manage")
public class FunctionController {
	
	@Autowired
	private FunctionServiceImpl  functionService;
	
	/**
	 * 功能列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/functionList")
	public String functionList(HttpServletRequest request) {
		
		List<Function> list = functionService.getAllFunction();
		request.setAttribute("list", list);
		
		return "manage/functionList";
	}
	
	/**
	 * 增加功能
	 * @param request
	 * @return
	 */
	@RequestMapping("/addFunction")
	public String addFunction(HttpServletRequest request) {
		
		List<Function> list = functionService.getAllFunction();
		List<Function> firstList = new ArrayList<Function>();
		
		if(list != null) {
			for(Function item:list) {
				if(item.getCateLevel().equals(new BigDecimal(1))) {
					firstList.add(item);
				}
			}
		}
		request.setAttribute("firstList", firstList);
		
		return "manage/addFunction";
	}
	
	/**
	 * 增加功能请求
	 * @param request
	 * @return
	 */
	@RequestMapping("/addFunctionAjax")
	@ResponseBody
	public JSONObject addFunctionAjax(HttpServletRequest request) {
		JSONObject obj = new JSONObject(); 
		
		if(!StringUtils.isEmpty(request.getParameter("supId"))
				&& StringUtils.isEmpty(request.getParameter("page"))) {
			obj.put("success", false);
			obj.put("msg", "返回页面不能为空");
			return obj;
		}
		if(StringUtils.isEmpty(request.getParameter("name")) || StringUtils.isEmpty(request.getParameter("code"))) {
			obj.put("success", false);
			obj.put("msg", "功能名称和编码不能为空");
			return obj;
		}
		
		Function function = new Function();
		function.setName(request.getParameter("name"));
		function.setCode(request.getParameter("code"));
		if(!StringUtils.isEmpty(request.getParameter("orderLevel"))){
			function.setOrderLevel(new BigDecimal(request.getParameter("orderLevel")));
		}
		function.setPage(request.getParameter("page"));
		if(!StringUtils.isEmpty(request.getParameter("supId"))){
			function.setSupId(new BigDecimal(request.getParameter("supId")));
		}
		
		functionService.save(function);
		
		obj.put("success", true);
		obj.put("msg", "增加成功");
		return obj;
	}
	
	/**
	 * 修改功能
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyFunction")
	public String modifyFunction(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(StringUtils.isEmpty(id)) {
			return null;
		}
		Function function = functionService.getById(new BigDecimal(id));
		if(function == null) {
			return null;
		}
		
		Function supFunction = functionService.getById(function.getSupId());
		
		request.setAttribute("function", function);
		request.setAttribute("supFunction", supFunction);
		return "manage/modifyFunction";
	}
	
	/**
	 * 修改功能请求
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyFunctionAjax")
	@ResponseBody
	public JSONObject modifyFunctionAjax(HttpServletRequest request) {
		JSONObject obj = new JSONObject(); 
		
		if(StringUtils.isEmpty(request.getParameter("id"))) {
			obj.put("success", false);
			obj.put("msg", "参数id为空");
			return obj;
		}
		
		if(!StringUtils.isEmpty(request.getParameter("supId"))
				&& StringUtils.isEmpty(request.getParameter("page"))) {
			obj.put("success", false);
			obj.put("msg", "返回页面不能为空");
			return obj;
		}
		if(StringUtils.isEmpty(request.getParameter("name")) || StringUtils.isEmpty(request.getParameter("code"))) {
			obj.put("success", false);
			obj.put("msg", "功能名称和编码不能为空");
			return obj;
		}
		
		Function function = new Function();
		function.setId(new BigDecimal(request.getParameter("id")));
		function.setName(request.getParameter("name"));
		function.setCode(request.getParameter("code"));
		if(!StringUtils.isEmpty(request.getParameter("orderLevel"))){
			function.setOrderLevel(new BigDecimal(request.getParameter("orderLevel")));
		}
		function.setPage(request.getParameter("page"));
		if(!StringUtils.isEmpty(request.getParameter("supId"))){
			function.setSupId(new BigDecimal(request.getParameter("supId")));
		}
		
		Function modify = functionService.modify(function);
		if(modify == null) {
			obj.put("success", false);
			obj.put("msg", "修改失败");
			return obj;
		}
		obj.put("success", true);
		obj.put("msg", "修改成功");
		return obj;
	}
}
