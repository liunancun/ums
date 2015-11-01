package com.lnc.ums.menu.po;

import java.io.Serializable;

public class MenuPo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private String url;

    private Boolean admin;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

}
