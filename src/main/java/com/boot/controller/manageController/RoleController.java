package com.boot.controller.manageController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.boot.impl.manage.FunctionServiceImpl;
import com.boot.impl.manage.RoleServiceImpl;
import com.boot.model.manage.Function;
import com.boot.model.manage.Role;
import com.boot.tools.util.json.JsonUtil;
import com.boot.tools.util.string.StringTools;

import net.sf.json.JSONObject;

@Controller
@ComponentScan({"com.boot.service"})
@MapperScan("com.boot.mapper")
@RequestMapping("/manage")
public class RoleController {
	
	@Autowired
	private RoleServiceImpl  roleService;
	@Autowired
	private FunctionServiceImpl  functionService;
	

	/**
	 * 角色列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/roleList")
	public String roleList(HttpServletRequest request) {
		
		int  pageCurrent = StringUtils.isEmpty(request.getParameter("pageCurrent")) ? 1:Integer.valueOf(request.getParameter("pageCurrent"));
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 50:Integer.valueOf(request.getParameter("pageSize")); 
		
		Map<String,Object> conditions = new HashMap<String,Object>();
		conditions.put("endNum", pageCurrent*pageSize);
		conditions.put("beginNum", (pageCurrent -1)*pageSize + 1 );
		
		List<Role> list = roleService.getListPager(conditions);
		int count =  roleService.getCount();
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("pageCurrent", pageCurrent);
		request.setAttribute("pageSize",pageSize);
		
		return "manage/roleList";
	}
	
	/**
	 * 增加角色 页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/addRole")
	public String addRole(HttpServletRequest request) {
		return "manage/addRole";
	}
	
	/**
	 * 增加角色ajax
	 * @param request
	 * @return
	 */
	@RequestMapping("/addRoleAjax")
	@ResponseBody
	public JSONObject addRoleAjax(HttpServletRequest request) {
		
		JSONObject returnJson = DefaultJSON.getDefaultJSON();
		if(StringUtils.isEmpty(request.getParameter("name"))) {
			returnJson.put("success", false);
			returnJson.put("msg", "参数为空");
			return returnJson;
		}
		
		Role role = new Role();
		role.setName(request.getParameter("name"));
		roleService.save(role);
		
		returnJson.put("success", true);
		returnJson.put("msg", "增加成功");
		return returnJson;
	}
	
	/**
	 * 修改角色 页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyRole")
	public String modifyRole(HttpServletRequest request) {
		
		String id = request.getParameter("roleId");
		if(StringUtils.isEmpty(id)) {
			return null;
		}
		
		Role role = roleService.getById(new BigDecimal(id));
		if(role == null) {
			return null;
		}
		request.setAttribute("role", role);
		return "manage/modifyRole";
	}
	
	/**
	 * 修改角色ajax
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyRoleAjax")
	@ResponseBody
	public JSONObject modifyRoleAjax(HttpServletRequest request) {
		
		JSONObject returnJson = DefaultJSON.getDefaultJSON();
		if(StringUtils.isEmpty(request.getParameter("name")) ||
				StringUtils.isEmpty(request.getParameter("roleId"))) {
			returnJson.put("success", false);
			returnJson.put("msg", "参数为空");
			return returnJson;
		}
		
		Role role = new Role();
		role.setId(new BigDecimal(request.getParameter("roleId")));
		role.setName(request.getParameter("name"));
		roleService.modify(role);
		
		returnJson.put("success", true);
		returnJson.put("msg", "修改成功");
		return returnJson;
	}
	
	/**
	 * 删除角色ajax
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteRoleAjax")
	@ResponseBody
	public JSONObject deleteRoleAjax(HttpServletRequest request) {
		
		JSONObject returnJson = DefaultJSON.getDefaultJSON();
		if(StringUtils.isEmpty(request.getParameter("roleId"))) {
			returnJson.put("success", false);
			returnJson.put("msg", "参数为空");
			return returnJson;
		}
		
		int count = roleService.deleteById(new BigDecimal(request.getParameter("roleId")));
		if(count == 0) {
			returnJson.put("success", false);
			returnJson.put("msg", "删除失败 ");
			return returnJson;
		}
		
		returnJson.put("success", true);
		returnJson.put("msg", "删除成功");
		return returnJson;
	}
	
	
	/**
	 * 角色分配 页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/popedomList")
	public String popedomList(HttpServletRequest request) {
		
		String id = request.getParameter("roleId");
		if(StringUtils.isEmpty(id)) {
			return null;
		}
		
		Role role = roleService.getById(new BigDecimal(id));
		if(role == null) {
			return null;
		}
		
		List<Function> funlist = functionService.getAllFunction();
		
		request.setAttribute("role", role);
		request.setAttribute("popedoms", role.getPopedomJson());
		request.setAttribute("funlist", funlist);
		return "manage/popedomList";
	}
	
	@RequestMapping("/modifyPopedomAjax")
	@ResponseBody
	public JSONObject popedomAjax(HttpServletRequest request) {
		JSONObject returnJson = DefaultJSON.getDefaultJSON();
		
		String roleId = request.getParameter("roleId");
		String popedom = request.getParameter("popedomJson");
		
		if(StringUtils.isEmpty(roleId)) {
			returnJson.put("success", false);
			returnJson.put("msg", "参数为空");
			return returnJson;
		}
		
		if(!StringUtils.isEmpty(popedom)) {
			JSONObject  popedomJson = JSONObject.fromObject(popedom);
			
			List<String> popedomList = new ArrayList<String>();
			Iterator<String> keys = popedomJson.keys();
			while(keys.hasNext()) {
				String key = keys.next();
				popedomList.add(key);
			}
			
			Role role = new Role();
			role.setId(new BigDecimal(roleId));
			role.setPopedomJson(StringTools.list2String(popedomList, ","));
			
			roleService.modify(role);
		}
		
		return returnJson;
	}
}
