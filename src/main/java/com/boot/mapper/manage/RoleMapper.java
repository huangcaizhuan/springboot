package com.boot.mapper.manage;

import com.boot.model.manage.Role;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface RoleMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKeyWithBLOBs(Role record);

    int updateByPrimaryKey(Role record);
    
    /**
     * 分页查询
     * @param conditions
     * @return
     */
    public List<Role> selectByPage(Map<String,Object> conditions);
    /**
     * 获取总个数
    */
    public int getCount();
}