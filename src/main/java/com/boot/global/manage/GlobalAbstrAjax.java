package com.boot.global.manage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import com.boot.model.manage.Manager;
import com.boot.tools.util.json.JsonUtil;

public abstract class GlobalAbstrAjax {
	protected JSONObject jsonReturn;
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	
	protected Manager manager;
	
	public void GlobalAbstrAjaxAction() {
		jsonReturn = new JSONObject();
		jsonReturn.put("success", false);
		session = request.getSession(); 
		
		String managerStr = (String) session.getAttribute("loginManager");
		manager = JsonUtil.string2Obj(managerStr, Manager.class);
	}
	
	/**
	 *  任何转化失败都将不抛异常,而是返回最大值 Long.max<br>
	 *  Long.value() 方法不会返回null值,因此该方法也不可能返回null<br>
	 * (便于在用户搜索时输入字符串是类型转换失败仍可继续查询数据)
	 * @param val
	 * @return
	 */
	protected Long valOfLong(String str){
		Long val = null;
		try{
			val = Long.valueOf(str);
		}catch(Exception e){
			val = Long.MAX_VALUE;
		}
		
		return val;
	}
}
