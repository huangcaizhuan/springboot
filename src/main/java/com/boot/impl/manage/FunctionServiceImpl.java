package com.boot.impl.manage;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.boot.mapper.manage.FunctionMapper;
import com.boot.model.manage.Function;
import com.boot.service.manage.FunctionService;

@Service("functionService")
@ComponentScan({"com.boot.mapper.*"})
public class FunctionServiceImpl implements FunctionService{
	
	private Logger logger = Logger.getLogger(FunctionServiceImpl.class);
	
	@Resource
	private FunctionMapper functionMapper;
	
	@Override
	public List<Function> getAllFunction() {
		return functionMapper.selectAll();
	}

	@Override
	public Function save(Function function) {
		if(function == null){
			logger.error("save:参数对象为空");
			throw new RuntimeException("参数对象为空");
		}
		
		if(StringUtils.isEmpty(function.getName()) ) {
			logger.error("save:功能名称为空");
			throw new RuntimeException("功能名称为空");
		}
		
		if(function.getOrderLevel() == null) {
			function.setOrderLevel(new BigDecimal(20));
		}
		
		Function supFun = null;
		if(function.getSupId() != null) {
			supFun = functionMapper.selectByPrimaryKey(function.getSupId());
			if(supFun == null) {
				logger.error("save:上级功能不存在");
				throw new RuntimeException("上级功能不存在");
			}
		}else {
			function.setCateLevel(new BigDecimal(1));
		}
		
		int count = functionMapper.insertSelective(function);
		if(count == 0) {
			logger.error("save:保存失败");
			throw new RuntimeException("上保存失败");
		}
		//function.setId(saveVo.getId());
		
		/*if(supFun != null) {
			function.setCateLevel(supFun.getCateLevel().add(new BigDecimal(1)));
			function.setCode(supFun.getCode()+"-"+saveVo.getId());
		}else {
			function.setCode(String.valueOf(saveVo.getId()));
		}
		
		functionMapper.updateByPrimaryKeySelective(function);*/
		
		return null;
	}

	@Override
	public Function getById(BigDecimal id) {
		if(id == null){
			throw new RuntimeException("传入id为空");
		}
		return functionMapper.selectByPrimaryKey(id);
	}

	@Override
	public void initFunction() {
		//获取系统管理
		Function function = functionMapper.selectByPrimaryKey(new BigDecimal("1"));
		if(function == null) {
			function = new Function();
			function.setCateLevel(new BigDecimal("1"));
			function.setCode("1");
			function.setOrderLevel(new BigDecimal("100"));
			function.setName("系统管理");
			function.setId(new BigDecimal("1"));
			functionMapper.insertSelective(function);
		}
		Function function2 = functionMapper.selectByPrimaryKey(new BigDecimal("2"));
		if(function2 == null) {
			function2 = new Function();
			function2.setCateLevel(new BigDecimal(2));
			function2.setCode("1-2");
			function2.setSupId(new BigDecimal(1));
			function2.setPage("manage/functionList");
			function2.setOrderLevel(new BigDecimal("101"));
			function2.setName("功能管理");
			function2.setId(new BigDecimal("2"));
			functionMapper.insertSelective(function2);
		}
	}

}
