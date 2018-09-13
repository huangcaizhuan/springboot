package com.boot.service.goods;

import java.util.List;
import java.util.Map;

import com.boot.model.goods.Goods;

public interface GoodsService {

	/**
	 * 分页查询
	 * @param conditions
	 * @return
	 */
	public List<Goods> getListPager(Map<String,Object> conditions);
	
	/**
	 * 按条件获取总个数
	 * @param conditions
	 * @return
	 */
	public int getCount(Map<String,Object> conditions);
}
