package com.boot.impl.manage;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.boot.mapper.manage.RoleMapper;
import com.boot.model.manage.Role;
import com.boot.service.manage.RoleService;

@Service("roleService")
@ComponentScan({"com.boot.mapper.*"})
public class RoleServiceImpl implements RoleService{
	
	private Logger logger = Logger.getLogger(RoleServiceImpl.class);

	@Resource
	private RoleMapper roleMapper;
	
	@Override
	public Role getById(BigDecimal id) {
		if(id == null){
			throw new RuntimeException("传入id为空");
		}
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int save(Role role) {
		return roleMapper.insertSelective(role);
	}

	@Override
	public int modify(Role role) {
		return roleMapper.updateByPrimaryKeySelective(role);
	}

	@Override
	public List<Role> getListPager(Map<String, Object> conditions) {
		if(conditions == null) {
			return null;
		}
		if(conditions.get("beginNum") == null) {
			conditions.put("beginNum", 1);
		}
		if(conditions.get("endNum") == null) {
			conditions.put("endNum", roleMapper.getCount());
		}
		return roleMapper.selectByPage(conditions);
	}

	@Override
	public int getCount() {
		return roleMapper.getCount();
	}

}
