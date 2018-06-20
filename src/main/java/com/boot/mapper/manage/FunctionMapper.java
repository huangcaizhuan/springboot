package com.boot.mapper.manage;

import com.boot.model.manage.Function;
import java.math.BigDecimal;

public interface FunctionMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Function record);

    int insertSelective(Function record);

    Function selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Function record);

    int updateByPrimaryKey(Function record);
}