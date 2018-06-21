package com.boot.model.manage;

import java.io.Serializable;
import java.math.BigDecimal;

public class Role implements Serializable {
    private BigDecimal id;

    private String name;

    private String popedomJson;

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

    public String getPopedomJson() {
        return popedomJson;
    }

    public void setPopedomJson(String popedomJson) {
        this.popedomJson = popedomJson == null ? null : popedomJson.trim();
    }
}