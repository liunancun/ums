package com.lnc.ums.role.mapper;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.role.po.RolePo;

public interface RoleMapper {

    List<RolePo> query(RolePo role);

    List<RolePo> query(RolePo role, PageBounds pageBounds);

    RolePo queryById(int id);

    void insert(RolePo role);

    void delete(int id);

    void update(RolePo role);

    List<String> queryResources(int id);

}
