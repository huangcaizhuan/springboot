package com.boot.impl.manage;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.boot.mapper.manage.ManagerMapper;
import com.boot.model.manage.Manager;
import com.boot.service.manage.ManagerService;
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
				|| StringUtils.isEmpty(record.getPassword()) || StringUtils.isEmpty(record.getUserName()) ){
			logger.error("save:参数对象为空");
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
		
		Manager temp = new Manager();
		temp.setUserName(record.getUserName());
		List<Manager> tempList = managerMapper.selectByConditions(temp);
		if(tempList != null && tempList.size() > 0) {
			throw new RuntimeException("该登录名已存在");
		}
		//record.setPassword(MD5.digest(record.getPassword()));
		record.setStatus("1");
		
		return managerMapper.insertSelective(record);
	}
	
	@Override
	public int modify(Manager record) {
		
		if(record == null || record.getId() == null || 
				StringUtils.isEmpty(record.getName()) || StringUtils.isEmpty(record.getUserName()) ){
			logger.error("modify:参数对象为空");
			throw new RuntimeException("参数对象为空");
		}
		
		if(StringUtils.isEmpty(record.getTel()) ) {
			logger.error("modify:手机号不能为空");
			throw new RuntimeException("手机号不能为空");
		}
		if(!ValidateUtil.validateMobile(record.getTel())) {
			logger.error("modify:手机号格式错误");
			throw new RuntimeException("手机号格式错误");
		}
		
		Manager temp = new Manager();
		temp.setUserName(record.getUserName());
		List<Manager> tempList = managerMapper.selectByConditions(temp);
		if(tempList != null && tempList.size() > 0 && tempList.get(0) != null) {
			if(!tempList.get(0).getId().equals(record.getId())) {
				logger.error("modify:该登录名已存在");
				throw new RuntimeException("该登录名已存在");
			}
		}
		record.setPassword(null);
		record.setStatus(null);
		
		return managerMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public Manager getByNameOrTelAndPassword(String accountStr, String password) {
		
		if(StringUtils.isEmpty(accountStr) ||  StringUtils.isEmpty(password)) {
			logger.error("getByNameOrTelAndPassword:参数对象为空");
			throw new RuntimeException("参数对象为空");
		}
		
		//按登录名查找
		Manager manager = new Manager();
		manager.setUserName(accountStr);
		manager.setPassword(password);
		List<Manager> managerList = managerMapper.selectByConditions(manager);
		if(managerList != null && managerList.size() > 0 && managerList.get(0) != null) {
			return managerList.get(0);
		}
		
		//按手机号查找
		Manager manager1 = new Manager();
		manager1.setTel(accountStr);
		manager1.setPassword(password);
		List<Manager> managerList1 = managerMapper.selectByConditions(manager1);
		if(managerList1 != null && managerList1.size() > 0 && managerList1.get(0) != null) {
			return managerList1.get(0);
		}
		return null;
	}
	@Override
	public List<Manager> getListPager(Map<String, Object> conditions) {
		if(conditions == null) {
			return null;
		}
		if(conditions.get("beginNum") == null) {
			conditions.put("beginNum", 1);
		}
		if(conditions.get("endNum") == null) {
			conditions.put("endNum", managerMapper.getCountByConditions(conditions));
		}
		return managerMapper.selectByPage(conditions);
	}
	@Override
	public int getCount(Map<String, Object> conditions) {
		return managerMapper.getCountByConditions(conditions);
	}

}
