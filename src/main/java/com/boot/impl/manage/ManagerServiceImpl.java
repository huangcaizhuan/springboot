package com.boot.impl.manage;

import java.math.BigDecimal;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.boot.mapper.manage.ManagerMapper;
import com.boot.model.manage.Manager;
import com.boot.service.manage.ManagerService;
import com.boot.tools.util.security.MD5;
import com.boot.tools.util.validate.ValidateUtil;

@Service("managerService")
@ComponentScan({"com.boot.mapper.*"})
public class ManagerServiceImpl implements ManagerService{

	private Logger logger = Logger.getLogger(ManagerServiceImpl.class);
	
	@Resource
	private ManagerMapper managerMapper;
	@Override
	public Manager getById(BigDecimal id) {
		if(id == null){
			throw new RuntimeException("传入id为空");
		}
		return managerMapper.selectByPrimaryKey(id);
	}
	@Override
	public int save(Manager record) {
		
		if(record == null || record.getName() == null || StringUtils.isEmpty(record.getName()) 
				|| StringUtils.isEmpty(record.getPassword()) ){
			logger.error("modify:参数对象为空");
			throw new RuntimeException("参数对象为空");
		}
		
		Boolean validate = true;
		if(record.getId() != null && record.getId().equals(new BigDecimal("100"))) {
			validate = false;
		}
		if(validate) {
			if(StringUtils.isEmpty(record.getTel()) ) {
				throw new RuntimeException("手机号不能为空");
			}
			if(!ValidateUtil.validateMobile(record.getTel())) {
				throw new RuntimeException("手机号格式错误");
			}
		}
		
		if(record.getPassword().length() < 6) {
			throw new RuntimeException("密码位数不能小于6位");
		}
		
		record.setPassword(MD5.digest(record.getPassword()));
		record.setStatus("1");
		
		return managerMapper.insertSelective(record);
	}

}