package com.boot.impl.manage;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.boot.mapper.manage.FunctionMapper;
import com.boot.model.manage.Function;
import com.boot.service.manage.FunctionService;

@Service("functionService")
@ComponentScan({"com.boot.mapper.*"})
public class FunctionServiceImpl implements FunctionService{

	@Resource
	private FunctionMapper functionMapper;
	
	@Override
	public List<Function> getAllFunction() {
		return functionMapper.selectAll();
	}

}
