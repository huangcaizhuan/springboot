package com.boot.mapper.goods;

import java.math.BigDecimal;

import com.boot.model.goods.GoodsPrice;

public interface GoodsPriceMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(GoodsPrice record);

    int insertSelective(GoodsPrice record);

    GoodsPrice selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(GoodsPrice record);

    int updateByPrimaryKey(GoodsPrice record);
}