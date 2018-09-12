package com.boot.model.goods;

import java.io.Serializable;
import java.math.BigDecimal;

public class GoodsCategory implements Serializable {
    private BigDecimal id;

    private String name;

    private String code;

    private BigDecimal cateLevel;

    private BigDecimal supId;

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

    public BigDecimal getCateLevel() {
        return cateLevel;
    }

    public void setCateLevel(BigDecimal cateLevel) {
        this.cateLevel = cateLevel;
    }

    public BigDecimal getSupId() {
        return supId;
    }

    public void setSupId(BigDecimal supId) {
        this.supId = supId;
    }
}