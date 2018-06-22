package com.boot.global.manage;

import net.sf.json.JSONObject;

public class DefaultJSON{

	public static JSONObject getDefaultJSON(){
		JSONObject json = new JSONObject();
		json.put("success", true);
		json.put("msg", "请求成功");
		json.put("data", null);
		return json;
	}
}
