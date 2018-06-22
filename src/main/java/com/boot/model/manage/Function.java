package com.boot.model.manage;

import java.io.Serializable;
import java.math.BigDecimal;

public class Function implements Serializable {
    private BigDecimal id;

    private String name;

    private String code;

    private BigDecimal supId;

    private BigDecimal orderLevel;

    private String page;

    private String createTimestamp;

    private BigDecimal cateLevel;

    private static final long serialVersionUID = 1L;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public BigDecimal getSupId() {
        return supId;
    }

    public void setSupId(BigDecimal supId) {
        this.supId = supId;
    }

    public BigDecimal getOrderLevel() {
        return orderLevel;
    }

    public void setOrderLevel(BigDecimal orderLevel) {
        this.orderLevel = orderLevel;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page == null ? null : page.trim();
    }

    public BigDecimal getCateLevel() {
        return cateLevel;
    }

    public String getCreateTimestamp() {
		return createTimestamp;
	}

	public void setCreateTimestamp(String createTimestamp) {
		this.createTimestamp = createTimestamp;
	}

	public void setCateLevel(BigDecimal cateLevel) {
        this.cateLevel = cateLevel;
    }
}