package com.boot.service.manage;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.boot.model.manage.Role;

public interface RoleService {

	/**
	 * 根据id获取
	 * @param id
	 * @return
	 */
	public Role getById(BigDecimal id);
	
	/**
	 * 保存
	 * @param record
	 * @return
	 */
	public int save(Role role);
	
	/**
	 * 修改
	 * @param record
	 * @return
	 */
	public int modify(Role role);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int deleteById(BigDecimal id);
	
	/**
	 * 分页查询
	 * @param conditions
	 * @return
	 */
	public List<Role> getListPager(Map<String,Object> conditions);
	
	/**
	 * 按条件获取总个数
	 * @param conditions
	 * @return
	 */
	public int getCount();
}
