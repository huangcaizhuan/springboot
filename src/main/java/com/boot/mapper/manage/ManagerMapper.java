package com.boot.mapper.manage;

import com.boot.model.manage.Manager;
import java.math.BigDecimal;
import java.util.List;

public interface ManagerMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
    
    /**
     * 按条件获取信息
     * @param record
     * @return
     */
    public List<Manager> selectByCoditions(Manager record);
}