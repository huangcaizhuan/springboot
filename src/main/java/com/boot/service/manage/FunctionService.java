package com.boot.service.manage;

import java.util.List;

import com.boot.model.manage.Function;

public interface FunctionService {
	
	/**
	 * 获取系统所有的功能
	 * @return
	*/
	public List<Function> getAllFunction();
}
