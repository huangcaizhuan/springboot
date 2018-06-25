package com.boot.impl.manage;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.boot.mapper.manage.FunctionMapper;
import com.boot.model.manage.Function;
import com.boot.service.manage.FunctionService;

import net.sf.json.JSONObject;

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
	public int save(Function function) {
		if(function == null){
			logger.error("save:参数对象为空");
			throw new RuntimeException("参数对象为空");
		}
		
		if(StringUtils.isEmpty(function.getName()) ) {
			logger.error("save:功能名称为空");
			throw new RuntimeException("功能名称为空");
		}
		
		if(StringUtils.isEmpty(function.getCode()) ) {
			logger.error("save:功能编码为空");
			throw new RuntimeException("功能编码为空");
		}
		
		if(functionMapper.selectByName(function.getName()) != null){
			logger.error("save:该名称已存在");
			throw new RuntimeException("该名称已存在");
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
			function.setCateLevel(supFun.getCateLevel().add(new BigDecimal(1)));
		}else {
			function.setCateLevel(new BigDecimal(1));
		}
		
		int count = functionMapper.insertSelective(function);
		if(count == 0) {
			logger.error("save:保存失败");
			throw new RuntimeException("保存失败");
		}
		
		return count;
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
			function.setCode("01");
			function.setOrderLevel(new BigDecimal("100"));
			function.setName("系统管理");
			function.setId(new BigDecimal("1"));
			functionMapper.insertSelective(function);
		}
		Function function2 = functionMapper.selectByPrimaryKey(new BigDecimal("2"));
		if(function2 == null) {
			function2 = new Function();
			function2.setCateLevel(new BigDecimal(2));
			function2.setCode("0101");
			function2.setSupId(new BigDecimal(1));
			function2.setPage("manage/functionList");
			function2.setOrderLevel(new BigDecimal("101"));
			function2.setName("功能管理");
			function2.setId(new BigDecimal("2"));
			functionMapper.insertSelective(function2);
		}
	}

	@Override
	public Function modify(Function function) {
		if(function == null || function.getId() == null || 
				function.getId().equals(new BigDecimal("0")) ){
			logger.error("modify:参数对象为空");
			throw new RuntimeException("参数对象为空");
		}
		
		if(StringUtils.isEmpty(function.getName()) ) {
			logger.error("modify:功能名称为空");
			throw new RuntimeException("功能名称为空");
		}
		
		if(StringUtils.isEmpty(function.getCode()) ) {
			logger.error("modify:功能编码为空");
			throw new RuntimeException("功能编码为空");
		}
		
		if(function.getOrderLevel() == null) {
			function.setOrderLevel(new BigDecimal(20));
		}
		
		Function po = functionMapper.selectByPrimaryKey(function.getId());
		if( po== null) {
			logger.error("modify:对象不存在");
			throw new RuntimeException("对象不存在");
		}
		
		Function nameFun = functionMapper.selectByName(function.getName());
		if(nameFun != null && !function.getId().equals(nameFun.getId())){
			logger.error("modify:该名称已存在");
			throw new RuntimeException("该名称已存在");
		}
		
		Function supFun = null;
		if(function.getSupId() != null) {
			supFun = functionMapper.selectByPrimaryKey(function.getSupId());
			if(supFun == null) {
				logger.error("modify:上级功能不存在");
				throw new RuntimeException("上级功能不存在");
			}
			function.setCateLevel(supFun.getCateLevel().add(new BigDecimal(1)));
		}else {
			function.setCateLevel(new BigDecimal(1));
		}
		
		int count = functionMapper.updateByPrimaryKeySelective(function);
		if(count == 0) {
			logger.error("modify:修改失败");
			throw new RuntimeException("修改失败");
		}
		
		return functionMapper.selectByPrimaryKey(function.getId());
	}

}
