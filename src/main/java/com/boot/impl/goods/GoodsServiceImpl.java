package com.boot.impl.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.boot.mapper.goods.GoodsMapper;
import com.boot.model.goods.Goods;
import com.boot.service.goods.GoodsService;

@Service("goodsService")
@ComponentScan({"com.boot.mapper.*"})
public class GoodsServiceImpl implements GoodsService{

	private Logger logger = Logger.getLogger(GoodsServiceImpl.class);
	
	@Resource
	private GoodsMapper goodsMapper;
	@Override
	public List<Goods> getListPager(Map<String, Object> conditions) {
		if(conditions == null) {
			return null;
		}
		if(conditions.get("beginNum") == null) {
			conditions.put("beginNum", 1);
		}
		if(conditions.get("endNum") == null) {
			conditions.put("endNum", goodsMapper.getCountByConditions(conditions));
		}
		return goodsMapper.selectByPage(conditions);
	}

	@Override
	public int getCount(Map<String, Object> conditions) {
		return goodsMapper.getCountByConditions(conditions);
	}
	
}
