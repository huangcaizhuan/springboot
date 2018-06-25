package com.boot.service.manage;

import java.math.BigDecimal;
import java.util.List;

import com.boot.model.manage.Function;

public interface FunctionService {
	
	/**
	 * 初始化功能表
	 */
	public void initFunction();
	/**
	 * 获取系统所有的功能
	 * @return
	*/
	public List<Function> getAllFunction();
	
	/**
	 * 增加功能
	 * @param function
	 * @return
	 */
	public int  save(Function function);
	
	/**
	 * 根据id获取
	 * @param id
	 * @return
	 */
	public Function getById(BigDecimal id);
	
	/**
	 * 修改功能
	 * @param id
	 * @return
	 */
	public Function modify(Function function);
}
