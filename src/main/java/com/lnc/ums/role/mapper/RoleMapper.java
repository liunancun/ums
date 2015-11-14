package com.lnc.ums.role.mapper;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.role.bean.RoleBean;

public interface RoleMapper {

    List<RoleBean> query(RoleBean role);

    List<RoleBean> query(RoleBean role, PageBounds pageBounds);

    RoleBean queryById(int id);

    void insert(RoleBean role);

    void delete(int id);

    void update(RoleBean role);

    List<String> queryResources(int id);

}
