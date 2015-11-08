package com.lnc.ums.role.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.role.po.RolePo;

public interface RoleService {

    List<RolePo> query(RolePo role);

    List<RolePo> query(RolePo role, PageBounds pageBounds);

    void save(RolePo role);

    void delete(int id);

    void update(RolePo role);

}
