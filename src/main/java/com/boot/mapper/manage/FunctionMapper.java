package com.boot.mapper.manage;

import com.boot.model.manage.Function;
import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FunctionMapper {
	public int deleteByPrimaryKey(BigDecimal id);

	public int insert(Function record);

	public int insertSelective(Function record);

	public Function selectByPrimaryKey(BigDecimal id);

	public int updateByPrimaryKeySelective(Function record);

	public int updateByPrimaryKey(Function record);
    
	/**
	 * 获取所有功能信息
	 * @return
	 */
	public List<Function> selectAll();
}