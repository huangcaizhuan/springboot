package com.boot.mapper.goods;

import java.math.BigDecimal;

import com.boot.model.goods.GoodsCategory;

public interface GoodsCategoryMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(GoodsCategory record);

    int insertSelective(GoodsCategory record);

    GoodsCategory selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(GoodsCategory record);

    int updateByPrimaryKey(GoodsCategory record);
}