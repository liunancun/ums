package com.lnc.ums.role.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class RoleBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;

    private String name;

    private Timestamp createTime;

    private String desc;

    private String namelike;

    private Timestamp startTime;

    private Timestamp endTime;

    private List<String> resources;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getNamelike() {
        return namelike;
    }

    public void setNamelike(String namelike) {
        this.namelike = namelike;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public List<String> getResources() {
        return resources;
    }

    public void setResources(List<String> resources) {
        this.resources = resources;
    }

}
