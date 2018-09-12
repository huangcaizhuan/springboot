package com.boot.mapper.goods;

import java.math.BigDecimal;

import com.boot.model.goods.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKeyWithBLOBs(Goods record);

    int updateByPrimaryKey(Goods record);
}