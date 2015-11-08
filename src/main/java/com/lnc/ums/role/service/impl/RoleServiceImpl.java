package com.lnc.ums.role.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.role.mapper.RoleMapper;
import com.lnc.ums.role.po.RolePo;
import com.lnc.ums.role.service.RoleService;

public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<RolePo> query(RolePo role) {

        List<RolePo> roles = roleMapper.query(role);

        return roles;
    }

    @Override
    public List<RolePo> query(RolePo role, PageBounds pageBounds) {

        List<RolePo> roles = roleMapper.query(role, pageBounds);

        return roles;
    }

    @Override
    public void save(RolePo role) {
        roleMapper.insert(role);
    }

    @Override
    public void delete(int id) {
        roleMapper.delete(id);
    }

    @Override
    public void update(RolePo role) {
        roleMapper.update(role);
    }

}
