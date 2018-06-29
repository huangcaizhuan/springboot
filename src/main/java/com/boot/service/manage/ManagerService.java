package com.boot.service.manage;


import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

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
	
	/**
	 * 修改
	 * @param record
	 * @return
	 */
	public int modify(Manager record);
	
	/**
	 * 根据用户名或手机号和密码获取信息，即登录
	 * @param accountStr
	 * @param password 加密之后的密码
	 * @return
	 */
	public Manager getByNameOrTelAndPassword(String accountStr,String password);
	
	/**
	 * 分页查询
	 * @param conditions
	 * @return
	 */
	public List<Manager> getListPager(Map<String,Object> conditions);
	
	/**
	 * 按条件获取总个数
	 * @param conditions
	 * @return
	 */
	public int getCount(Map<String,Object> conditions);
}
