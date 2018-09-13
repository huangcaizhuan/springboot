package com.boot.model.goods;

import java.math.BigDecimal;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class GoodsDto {
	
	/**
	 * 商品名称
	 */
	@NotEmpty(message = "商品名称不能为空")
	private String name;
	
	/**
	 * 商品分类
	 */
	@NotNull(message = "分类不能为空")
	private BigDecimal categoryId;
	
	/**
	 * 商品详情
	 */
	private String description;
	
	/**
	 * 多个图片
	 */
	@NotNull(message = "商品图片不能为空")
	private List<String> imgUrl;
	
	/**
	 * 显示的价格
	 */
	@NotNull(message = "价格不能为空")
	private BigDecimal price;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name== null ? null : name.trim();
	}

	public BigDecimal getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(BigDecimal categoryId) {
		this.categoryId = categoryId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public List<String> getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(List<String> imgUrl) {
		this.imgUrl = imgUrl;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	} 
}
