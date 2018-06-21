package com.boot.service.manage;


import java.math.BigDecimal;

import com.boot.model.manage.Manager;

public interface ManagerService {
	
	/**
	 * 根据id获取
	 * @param id
	 * @return
	 */
	public Manager getById(BigDecimal id);
	
	/**
	 * 保存
	 * @param record
	 * @return
	 */
	public int save(Manager record);
}
