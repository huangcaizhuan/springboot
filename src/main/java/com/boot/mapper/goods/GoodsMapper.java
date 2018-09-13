package com.boot.mapper.goods;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.boot.model.goods.Goods;
import com.boot.model.manage.Manager;

public interface GoodsMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKeyWithBLOBs(Goods record);

    int updateByPrimaryKey(Goods record);
    
    /**
     * 分页查询
     * @param conditions
     * @return
     */
    public List<Goods> selectByPage(Map<String,Object> conditions);
    
    /**
     * 获取总个数
     * @param conditions
     * @return
     */
    public  int getCountByConditions(Map<String,Object> conditions);
}