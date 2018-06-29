package com.boot.controller.manageController;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.global.manage.DefaultJSON;
import com.boot.impl.manage.ManagerServiceImpl;
import com.boot.model.manage.Manager;
import com.boot.tools.util.security.MD5;

import net.sf.json.JSONObject;

@Controller
@ComponentScan({"com.boot.service"})
@MapperScan("com.boot.mapper")
@RequestMapping("/manage")
public class ManagerController {

	@Autowired
	private ManagerServiceImpl  managerService;
	
	/**
	 * 管理员列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/managerList")
	public String managerList(HttpServletRequest request) {
		
		int  page = StringUtils.isEmpty(request.getParameter("page")) ? 1:Integer.valueOf(request.getParameter("page"));
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 50:Integer.valueOf(request.getParameter("pageSize")); 
		
		String name = request.getParameter("name");
		
		Map<String,Object> conditions = new HashMap<String,Object>();
		conditions.put("endNum", page*pageSize);
		conditions.put("beginNum", (page -1)*pageSize + 1 );
		conditions.put("name", StringUtils.isEmpty(name) ? null:"%"+name+"%");
		conditions.put("tel", StringUtils.isEmpty(request.getParameter("tel")) ? null:request.getParameter("tel"));
		conditions.put("status", StringUtils.isEmpty(request.getParameter("status"))?null:request.getParameter("status"));
		
		List<Manager> list = managerService.getListPager(conditions);
		int count =  managerService.getCount(conditions);
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("pageSize",pageSize);
		request.setAttribute("name", name);
		request.setAttribute("tel", request.getParameter("tel"));
		request.setAttribute("status", request.getParameter("status"));
		
		return "manage/managerList";
	}
	
	/**
	 * 增加管理员页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/addManager")
	public String addManager(HttpServletRequest request) {
		return "manage/addManager";
	}
	
	/**
	 * 增加管理员ajax
	 * @param request
	 * @return
	 */
	@RequestMapping("/addManagerAjax")
	@ResponseBody
	public JSONObject addManagerAjax(HttpServletRequest request) {
		
		JSONObject returnJson = DefaultJSON.getDefaultJSON();
		if(StringUtils.isEmpty(request.getParameter("name")) || StringUtils.isEmpty(request.getParameter("password"))
				|| StringUtils.isEmpty(request.getParameter("tel") ) ||StringUtils.isEmpty(request.getParameter("userName"))) {
			
			returnJson.put("success", false);
			returnJson.put("msg", "参数为空");
			return returnJson;
		}
		
		Manager manager = new Manager();
		manager.setName(request.getParameter("name"));
		manager.setEmail(request.getParameter("email"));
		manager.setTel(request.getParameter("tel"));
		manager.setUserName(request.getParameter("userName"));
		manager.setPassword(MD5.digest(request.getParameter("password")));
		managerService.save(manager);
		
		returnJson.put("success", true);
		returnJson.put("msg", "增加成功");
		return returnJson;
	}
	
	/**
	 * 修改管理员页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyManager")
	public String modifyManager(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		if(StringUtils.isEmpty(id)) {
			return null;
		}
		
		Manager manager = managerService.getById(new BigDecimal(id));
		if(manager == null) {
			return null;
		}
		request.setAttribute("manager", manager);
		return "manage/modifyManager";
	}
	
	/**
	 * 修改管理员ajax
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyManagerAjax")
	@ResponseBody
	public JSONObject modifyManagerAjax(HttpServletRequest request) {
		
		JSONObject returnJson = DefaultJSON.getDefaultJSON();
		if(StringUtils.isEmpty(request.getParameter("name")) || StringUtils.isEmpty(request.getParameter("tel")) 
				||StringUtils.isEmpty(request.getParameter("userName"))) {
			
			returnJson.put("success", false);
			returnJson.put("msg", "参数为空");
			return returnJson;
		}
		
		Manager manager = new Manager();
		manager.setId(new BigDecimal(request.getParameter("id")));
		manager.setName(request.getParameter("name"));
		manager.setEmail(request.getParameter("email"));
		manager.setTel(request.getParameter("tel"));
		manager.setUserName(request.getParameter("userName"));
		managerService.modify(manager);
		
		returnJson.put("success", true);
		returnJson.put("msg", "修改成功");
		return returnJson;
	}
}

